require_relative 'meta'


class IRecorder
    include Meta_Functions

    attr_accessor :remote
    attr_reader :num_A, :num_B

    def initialize(remote)
        self.remote = remote

        self.make_writer_only :play, :stop, :record, :ff, :rew
    end

    def getter(param)
        raise NotImplementedError
    end

    def setter(param, value)
        raise NotImplementedError
    end

    def cmd
        raise NotImplementedError
    end
end


class Recorder < IRecorder
    def initialize(remote, layout_bus)
        super(remote)

        num_A = layout_bus[:p_out]
        num_B = layout_bus[:v_out]

        _make_channel_props(num_A, num_B)
    end

    def getter(param)
        @remote.get_parameter("#{self.cmd}.#{param}")
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        return "recorder"
    end
end
