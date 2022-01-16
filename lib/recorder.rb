require_relative 'meta'


class IRecorder
    include Meta_Functions

    attr_accessor :remote

    def initialize(remote)
        self.remote = remote
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


class Recorder < IRecorder
    def initialize(remote, layout_bus)
        super(remote)
        self.make_writer_only :play, :stop, :record, :ff, :rew

        num_A = layout_bus[:p_out]
        num_B = layout_bus[:v_out]
        self._make_channel_props(num_A, num_B)
    end

    def cmd
        return "recorder"
    end
end
