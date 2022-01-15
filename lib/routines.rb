require_relative 'base'
require_relative 'runvm'
require_relative 'strip'
require_relative 'bus'
require_relative 'button'
require_relative 'vban'
require_relative 'command'
require_relative 'recorder'


class Routines
    """
    define basic behaviours of API functions
    mixin modules
    """
    include Define_Version
    include RunVM

    attr_accessor :properties, :layout, :strip, :bus, :button, :vban, :command,
    :recorder

    attr_reader :retval

    SIZE = 1
    BUFF = 512

    def initialize(kind)
        define_version(kind)

        self.strip = Strip.make(self, @layout[:strip], @layout[:bus])
        self.bus = Bus.make(self, @layout[:bus])
        self.button = MacroButton.make(self, @layout[:mb])
        self.vban = Vban.make(self, @layout[:vban])
        self.command = Command.new(self)
        self.recorder = Recorder.new(self, @layout[:bus])
    end

    def login
        run_as("login")
        clear_polling

    rescue CAPIErrors => error
        case
        when error.value == 1
            run_voicemeeter
        when error.value < 0
            raise
        end
    end

    def logout
        clear_polling
        run_as("logout")
    end

    def get_parameter(name, is_string=false)
        self.polling(__method__.to_s)

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

    def set_parameter(name, value)
        if value.is_a? String
            run_as("set_parameter_string", name, value)
        else    
            run_as("set_parameter_float", name, value.to_f)
        end
    end

    def macro_getstatus(id, mode)
        self.polling(__method__.to_s)

        c_get = FFI::MemoryPointer.new(:float, SIZE)
        run_as("macro_getstatus", id, c_get, mode)
        c_get.read_float.to_i
    end

    def macro_setstatus(id, state, mode)
        run_as("macro_setstatus", id, state, mode)
    end
end
