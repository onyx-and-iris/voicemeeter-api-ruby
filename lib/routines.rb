require 'open3'

require_relative 'base'
require_relative 'channels'
require_relative 'alias'

class Routines
    """
    define basic behaviours of API functions
    mixin modules
    """
    include FunctionHooks
    include BuildStrips
    include Alias

    attr_accessor :val, :param_cache, :base_0, :rundelay
    attr_reader :ret, :type, :logged_in, :logged_out, :sp_command, :sp_value,
    :param_string, :param_options, :param_float, :param_name, :instdir,
    :inst_exe, :pid

    SIZE = 1
    BUFF = 512

    def ret=(value)
        """ C API return value """
        raise APIError if value&.nonzero?

        @ret = value
    rescue APIError => error
        puts "#{error.class}: #{error.message} #{value} in #{caller_locations[1].label}"
        raise
    end

    def logged_in=(value)
        """
        login success status
        1: OK but Voicemeeter Application not launched.
        -1: cannot get client (unexpected)
        -2: unexpected login (logout was expected before).
        """
        if value == 0
            @logged_in = value
        elsif value == 1
            runvb
            sleep(@rundelay)
        elsif value < 0
            raise LoginError
        end
        clear_pdirty
        clear_mdirty

    rescue LoginError => error
        puts "#{error.class}: #{error.message} #{value}"
        raise
    end

    def logged_out=(value)
        raise LogoutError if value&.nonzero?

        @logged_out = value
    rescue LogoutError => error
        puts "#{error.class}: #{error.message}"
        raise
    end

    def type=(value)
        """ Determine the Voicemeeter type """
        if value == "basic" || value == 1
            @type = BASIC
        elsif value == "banana" || value == 2
            @type = BANANA
        elsif value == "potato" || value == 3
            @type = POTATO
        else
            raise VBTypeError
        end
    rescue VBTypeError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
        raise
    end

    def sp_command=(value)
        unless ['Shutdown', 'Show', 'Restart',
            'DialogShow.VBANCHAT', 'Eject',
            'Reset', 'Save', 'Load'].include? value
            raise CommandError
        end
        @sp_command = "Command.#{value}"

    rescue CommandError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
        raise
    end

    def sp_value=(value)
        raise ValueTypeError unless value.is_a? (String)

        @sp_value = value
    rescue ValueTypeError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
        raise
    end

    def param_cache=(*args)
        type, *remaining = args[0]
        if type == "macros"
            logical_id, mode, state = *remaining
            @param_cache["mb_#{logical_id}_#{mode}"] = state
        elsif type == "params"
            param, value = *remaining
            @param_cache[param] = value
        end
    end

    def param_name=(value)
        """
        Test against available regex
        If no matches continue with assignment but there
        will be no boundary testing
        """
        if test_regex(/^(\w+)\[(\d+)\].(\w+)/, value) == 3
        elsif test_regex(/^vban.(\w+)\[(\d+)\].(\w+)/, value) == 3
        elsif test_regex(/^Fx.(\w+).On/, value) == 1
        elsif test_regex(/^patch.(\w+)\[(\d+)\]/, value) == 2
        elsif test_regex(/^(recorder).([A-B][1-5])/, value) == 2
        else
            @m1 = nil
            @m2 = nil
            @m3 = nil
        end

        @param_name = value
    end

    def param_value=(value)
        if value.is_a? (String)
            @param_string = value
        else
            if ["recorder"].include? @m1
                raise ParamValueError unless validate(@m2, value)
            end
            raise ParamValueError unless validate(@m3, value)

            @param_float = value
        end
    rescue ParamValueError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
        raise
    end

    def param_options=(value)
        """ Test options against regex then build param string """
        @param_options = Hash.new
        strip_params = []
        bus_params = []
        mb_params = []
        vban_params = []

        value.each do |key, val|
            if test_regex(/(\w+)_(\d+)/, key) == 2
                name = @m1
                num = (@base_0 ? @m2 : shiftdn(@m2))
            elsif test_regex(/(\w+)_([a-z]+)(\d+)/, key) == 3
                name = @m1
                dir = @m2
                num = (@base_0 ? @m3 : shiftdn(@m3))
            end

            val.each do |k, v|
                v = bool_to_int(v) if [false,true].include? v

                if validate(name, num)
                    if name == "strip"
                        strip_params.append(
                            "#{name.capitalize}[#{num.to_s}].#{k} = #{v}"
                        )
                        self.param_cache =
                        ["params", "#{name.capitalize}[#{num.to_s}].#{k}", v]
                    elsif name == "bus"
                        bus_params.append(
                            "#{name.capitalize}[#{num.to_s}].#{k} = #{v}"
                        )
                        self.param_cache =
                        ["params", "#{name.capitalize}[#{num.to_s}].#{k}", v]
                    elsif name == "mb"
                        mode = 1 if k == "state"
                        mode = 2 if k == "stateonly"
                        mode = 3 if k == "trigger"
                        mb_params.append(
                            [num,v,mode]
                        )
                        self.param_cache = ["macros", num, mode, v]
                    elsif name == "vban"
                        param = "on" if k == "enable"
                        vban_params.append(
                            "#{name}.#{dir}stream[#{num.to_s}].#{param} = #{v}"
                        )
                    end
                end
            end
        end
        @param_options[:strip] = strip_params if strip_params.any?
        @param_options[:bus] = bus_params if bus_params.any?
        @param_options[:mb] = mb_params if mb_params.any?
        @param_options[:vban] = vban_params if vban_params.any?
    end

    def logical_id=(value)
        raise BoundsError unless value.between?(0,69)

        @logical_id = value
    end

    def mb_state=(value)
        raise BoundsError unless [0,1].include? value

        @mb_state = value
    end

    def base_0=(value)
        @base_0 = value
    end

    def pid=(value)
        @pid = value
    end

    def pid
        @pid
    end

    def initialize(type = nil, opts = {})
        self.base_0 = opts[:base_0] || false
        self.setdelay = opts[:setdelay] || ACCESSOR_DELAY
        self.getdelay = opts[:getdelay] || ACCESSOR_DELAY
        self.rundelay = opts[:rundelay] || RUNDELAY
        self.logoutdelay = opts[:logoutdelay] || LOGOUTDELAY
        self.shutdowndelay = opts[:shutdowndelay] || SHUTDOWNDELAY
        self.saveloaddelay = opts[:saveloaddelay] || SAVELOADDELAY

        if type
            self.type = type
            build_strips(@type)
            alias_factory
        end

        @param_cache = Hash.new
    end

    def runvb
        raise VBTypeError if @type.nil?

        self.inst_exe = @type
        stdin, stdout, stderr, wait_thread = Open3.popen3(@inst_exe, '')
        self.pid = wait_thread[:pid]
    rescue VBTypeError => error
        error.set_backtrace([])
        puts "#{error.class}: #{error.on_launch}"
        raise
    rescue EXENotFoundError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
        raise
    end

    def vbtype
        """ 1 = basic, 2 = banana, 3 = potato """
        c_get = FFI::MemoryPointer.new(:long, SIZE)

        self.ret = run_as(__method__, c_get)
        c_get.read_long
    end

    def login
        self.logged_in = run_as(__method__)
        if @type.nil?
            self.type = self.vbtype
            build_strips(@type)
            alias_factory
        end
    end

    def logout
        sleep(@logoutdelay)
        self.logged_out = run_as(__method__)
    end

    def macro_setstatus(logical_id, state, mode=2)
        """
        set macrobutton by number, state and mode
        """
        self.logical_id = logical_id
        self.mb_state = state
        self.ret = run_as(__method__, @logical_id, @mb_state, mode)
        self.param_cache = ["macros", logical_id, mode, state]

    rescue BoundsError => error
        puts "#{error.class}: Macrobutton ID out of range in #{__callee__}"
        raise
    end

    def macro_getstatus(logical_id, mode=2)
        if vmr_mdirty
            clear_mdirty
            if @param_cache.key?("mb_#{logical_id}_#{mode}")
                return @param_cache["mb_#{logical_id}_#{mode}"]
            end
        end

        c_get = FFI::MemoryPointer.new(:float, SIZE)
        self.logical_id = logical_id
        self.ret = run_as(__method__, @logical_id, c_get, mode)
        @val = type_return("macrobutton", c_get.read_float)

    rescue BoundsError => error
        puts "#{error.class}: Logical ID out of range in #{__callee__}"
        raise
    end

    def set_parameter(name, value)
        """
        determine if string or float parameter
        then set parameter by name, value
        """
        @param_string = nil
        @param_float = nil
        self.param_name = name
        self.param_value = value

        raise BoundsError unless validate(@m1, @m2)

        if @param_string
            self.ret =
            run_as("#{__method__}_string", @param_name, @param_string)
            self.param_cache = ["params", @param_name, @param_string]
        else
            self.ret =
            run_as("#{__method__}_float", @param_name, @param_float)
            self.param_cache = ["params", @param_name, @param_float]
        end
    rescue BoundsError, VersionError => error
        puts "#{error.class}: #{error.message} in #{__callee__}"
    end

    def set_parameter_multi(param_hash)
        self.param_options = param_hash
        @param_options.each do |key, val|
            if key == :mb
                val.each { |id, state, mode| macro_setstatus(id, state, mode) }
            else
                self.ret = run_as(__method__, val.join(";"))
            end
        end
    end

    def get_parameter(name)
        self.param_name = name
        if vmr_pdirty
            clear_pdirty
            if @param_cache.key?(@param_name)
                if @is_real_number.include? @m3
                    return type_return(@m3, @param_cache[@param_name])
                else
                    return @param_cache[@param_name]
                end
            end
        end

        if @is_real_number.include? @m3
            c_get = FFI::MemoryPointer.new(:float, SIZE)
            self.ret = run_as("#{__method__}_float", @param_name, c_get)
            @val = type_return(@m3, c_get.read_float)
        else
            c_get = FFI::MemoryPointer.new(:string, BUFF, true)
            self.ret = run_as("#{__method__}_string", @param_name, c_get)
            @val = c_get.read_string
        end
    end
end
