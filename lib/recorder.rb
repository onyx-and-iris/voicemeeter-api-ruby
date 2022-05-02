require_relative 'meta'

class IRecorder
    '
    Base Recorder class
    '
    include Meta_Functions

    def initialize(remote)
        @remote = remote
    end

    def getter(param)
        @remote.get_parameter("#{self.identifier}.#{param}")
    end

    def setter(param, value)
        @remote.set_parameter("#{self.identifier}.#{param}", value)
    end
end

class Recorder < IRecorder
    '
    Concrete Recorder class
    '
    def initialize(remote)
        super
        self.make_action_prop :play, :stop, :record, :ff, :rew

        num_A, num_B = remote.kind.layout[:bus].values
        self.make_accessor_bool *make_channel_props(num_A, num_B)
    end

    def identifier
        :recorder
    end
end
