require_relative 'runvm'
require_relative 'profiles'
require_relative 'errors'
require_relative 'strip'
require_relative 'bus'
require_relative 'button'
require_relative 'vban'
require_relative 'command'
require_relative 'recorder'

class Base
    '
    Base class responsible for wrapping the C Remote API

    Mixin required modules
    '
    include Profiles
    include RunVM

    attr_accessor :strip, :bus, :button, :vban, :command, :recorder

    attr_reader :kind, :retval, :cache, :profiles, :delay

    DELAY = 0.001
    SYNC = false
    SIZE = 1
    BUFF = 512

    def initialize(kind, **kwargs)
        super()
        @kind = kind
        @p_in, @v_in = kind.layout[:strip].values
        @p_out, @v_out = kind.layout[:bus].values
        @cache = Hash.new
        @sync = kwargs[:sync] || SYNC
        @delay = DELAY
        @profiles = get_profiles(@kind)
    end

    def login
        @cdll.call(:login)
        clear_polling
    rescue CAPIErrors => error
        case
        when error.value == 1
            self.start(@kind.name)
            clear_polling
        when error.value < 0
            raise
        end
    end

    def logout
        clear_polling
        sleep(0.1)
        @cdll.call(:logout)
    end

    def get_parameter(name, is_string = false)
        self.polling('get_parameter', name: name) do
            if is_string
                c_get = FFI::MemoryPointer.new(:string, BUFF, true)
                @cdll.call(:get_parameter_string, name, c_get)
                c_get.read_string
            else
                c_get = FFI::MemoryPointer.new(:float, SIZE)
                @cdll.call(:get_parameter_float, name, c_get)
                c_get.read_float.round(1)
            end
        end
    end

    def set_parameter(name, value)
        if value.is_a? String
            @cdll.call(:set_parameter_string, name, value)
        else
            @cdll.call(:set_parameter_float, name, value.to_f)
        end
        @cache.store(name, value)
    end

    def get_buttonstatus(id, mode)
        self.polling('get_buttonstatus', id: id, mode: mode) do
            c_get = FFI::MemoryPointer.new(:float, SIZE)
            @cdll.call(:get_buttonstatus, id, c_get, mode)
            c_get.read_float.to_i
        end
    end

    def set_buttonstatus(id, state, mode)
        @cdll.call(:set_buttonstatus, id, state, mode)
        @cache.store("mb_#{id}_#{mode}", state)
    end

    def set_parameter_multi(param_hash)
        param_hash.each do |(key, val)|
            prop, m2, m3, *rem = key.to_s.split('_')
            if m2.to_i.to_s == m2
                m2 = m2.to_i
            elsif m3.to_i.to_s == m3
                m3 = m3.to_i
            end

            case prop
            when 'strip'
                self.strip[m2].set_multi(val)
            when 'bus'
                self.bus[m2].set_multi(val)
            when 'button', 'mb'
                self.button[m2].set_multi(val)
            when 'vban'
                if %w[instream in].include? m2
                    self.vban.instream[m3].set_multi(val)
                elsif %w[outstream out].include? m2
                    self.vban.outstream[m3].set_multi(val)
                end
            end
            sleep(DELAY)
        end
    end

    def get_level(type, index)
        c_get = FFI::MemoryPointer.new(:float, SIZE)
        @cdll.call(:get_level, type, index, c_get)
        c_get.read_float
    end

    def strip_levels
        '
        Returns the full level array for strips, PREFADER mode, 
        before math conversion
        '
        (0...(2 * @p_in + 8 * @v_in)).map { |i| get_level(0, i) }
    end

    def bus_levels
        '
        Returns the full level array for buses, before math conversion
        '
        (0...(8 * (@p_out + @v_out))).map { |i| get_level(3, i) }
    end

    alias_method 'set_multi', :set_parameter_multi
    alias_method 'get', :get_parameter
    alias_method 'set', :set_parameter
    alias_method 'pdirty', :pdirty?
    alias_method 'mdirty', :pdirty?
end
