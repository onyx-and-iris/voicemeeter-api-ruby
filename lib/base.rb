require_relative 'libruby'
require_relative 'profiles'
require_relative 'runvm'
require_relative 'strip'
require_relative 'bus'
require_relative 'button'
require_relative 'vban'
require_relative 'command'
require_relative 'recorder'


class Base
    """
    Base class responsible for wrapping the C Remote API

    Mixin required modules
    """
    include Profiles
    include RunVM

    attr_accessor :kind, :strip, :bus, :button, :vban, :command, :recorder

    attr_reader :retval, :cache, :wait, :layout, :properties,
    :delay, :max_polls, :profiles

    SIZE = 1
    BUFF = 512

    def initialize(kind, **kwargs)
        @kind = kind
        @cache = Hash.new
        @wait = false
        @delay = kwargs[:delay] || DELAY
        @sync = kwargs[:sync] || SYNC
        @profiles = get_profiles(@kind)
    end

    def login
        run_as("login")
        clear_polling

    rescue CAPIErrors => error
        case
        when error.value == 1
            self.start(@properties[:name])
            clear_polling
        when error.value < 0
            raise
        end
    end

    def logout
        clear_polling
        run_as("logout")
    end

    def get_parameter(name, is_string=false)
        self.polling("get_parameter", name: name) do
            if is_string
                c_get = FFI::MemoryPointer.new(:string, BUFF, true)
                run_as("get_parameter_string", name, c_get)
                c_get.read_string
            else
                c_get = FFI::MemoryPointer.new(:float, SIZE)
                run_as("get_parameter_float", name, c_get)
                c_get.read_float.round(1)
            end
        end
    end

    def set_parameter(name, value)
        if value.is_a? String
            run_as("set_parameter_string", name, value)
        else    
            run_as("set_parameter_float", name, value.to_f)
        end
        @cache.store(name, value)
    end

    def macro_getstatus(id, mode)
        self.polling("macro_getstatus", id: id, mode: mode) do
            c_get = FFI::MemoryPointer.new(:float, SIZE)
            run_as("macro_getstatus", id, c_get, mode)
            c_get.read_float.to_i
        end
    end

    def macro_setstatus(id, state, mode)
        run_as("macro_setstatus", id, state, mode)
        @cache.store("mb_#{id}_#{mode}", state)
    end

    def set_parameter_multi(param_hash)
        param_hash.each do |(key,val)|
            prop, m2, m3, *rem = key.to_s.split('_')
            if m2.to_i.to_s == m2 then m2 = m2.to_i
            elsif m3.to_i.to_s == m3 then m3 = m3.to_i end

            case prop
            when "strip"
                self.strip[m2].set_multi(val)
            when "bus"
                self.bus[m2].set_multi(val)
            when "button", "mb"
                self.button[m2].set_multi(val)
            when "vban"
                if ["instream", "in"].include? m2
                    self.vban.instream[m3].set_multi(val)
                elsif ["outstream", "out"].include? m2
                    self.vban.outstream[m3].set_multi(val)
                end
            end

            sleep(DELAY)
        end
    end

    alias_method "set_multi", :set_parameter_multi
    alias_method "get", :get_parameter
    alias_method "set", :set_parameter
    alias_method "pdirty", :pdirty?
    alias_method "mdirty", :pdirty?
end
