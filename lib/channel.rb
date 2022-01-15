require_relative 'meta'


class IChannel
    include Channel_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_bool :mute, :mono
        self.make_accessor_float :gain
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
