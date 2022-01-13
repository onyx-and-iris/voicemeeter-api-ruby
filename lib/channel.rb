require_relative 'meta'

class IChannel
    include Meta_Functions

    attr_accessor :remote, :index
    attr_reader :num_A, :num_B

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_bool :mute, :mono
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