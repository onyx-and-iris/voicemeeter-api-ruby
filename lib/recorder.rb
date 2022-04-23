require_relative 'meta'

class IRecorder
    '
    Base class for Recorder object
    '
    include Meta_Functions

    attr_accessor :remote

    def initialize(remote)
        self.remote = remote
    end

    def getter(param)
        @remote.get_parameter("#{self.identifier}.#{param}")
    end

    def setter(param, value)
        @remote.set_parameter("#{self.identifier}.#{param}", value)
    end

    def cmd
        raise NotImplementedError
    end
end

class Recorder < IRecorder
    '
    Concrete class for recorder
    '
    def initialize(remote)
        super(remote)
        self.make_writer_only :play, :stop, :record, :ff, :rew

        num_A, num_B = remote.kind.layout[:bus].map { |k, v| v }
        self.make_accessor_bool *make_channel_props(num_A, num_B)
    end

    def identifier
        return :recorder
    end
end
