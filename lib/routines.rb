require_relative 'base'
require_relative 'layout'
require_relative 'strip'
require_relative 'bus'


class Routines
    """
    define basic behaviours of API functions
    mixin modules
    """
    include Base
    include Layout

    attr_accessor :layout, :strip, :bus

    SIZE = 1
    BUFF = 512


    def initialize(type)
        define_layout(type)

        self.strip = Strip.make(self, @layout[:strip], @layout[:bus])
        self.bus = Bus.make(self, @layout[:bus])
    end

    def login
        run_as("login")
    end

    def logout
        run_as("logout")
    end

    def get_parameter(name, is_string=false)
        self.polling

        if is_string
            c_get = FFI::MemoryPointer.new(:string, BUFF, true)
            run_as("get_parameter_string", name, c_get)
            c_get.read_string
        else
            c_get = FFI::MemoryPointer.new(:float, SIZE)
            run_as("get_parameter_float", name, c_get)
            c_get.read_float.to_i
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
        self.polling

        c_get = FFI::MemoryPointer.new(:float, SIZE)
        run_as("macro_getstatus", id, c_get, mode)
        c_get.read_float.to_i
    end

    def macro_setstatus(id, state, mode)
        run_as("macro_setstatus", id, state, mode)
    end
end
