require_relative 'meta'
require_relative 'errors'

class IChannel
    include Channel_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, i)
        self.remote = remote
        self.index = i
    end

    def getter(param, is_string=false)
        @remote.get_parameter("#{self.cmd}.#{param}", is_string)
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        raise NotImplementedError
    end
end
