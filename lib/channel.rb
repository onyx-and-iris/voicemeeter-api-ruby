require_relative 'meta'


class IChannel
    include Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_bool :mute, :mono
        self.make_accessor_float :gain
    end

    def getter(param)
        @remote.get_parameter("#{self.cmd}.#{param}")
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        raise NotImplementedError
    end
end
