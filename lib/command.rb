require_relative 'meta'

class ICommand
    include Commands_Meta_Functions

    def initialize(remote)
        @remote = remote
    end

    def setter(param, value)
        @remote.set_parameter("#{self.identifier}.#{param}", value)
    end

    def identifier
        :command
    end
end

class Command < ICommand
    def initialize(remote)
        super
        self.make_action_prop :show, :restart, :reset, :shutdown
        self.make_writer_bool :showvbanchat, :lock
    end

    def hide
        self.setter('show', 0)
    end

    def load(value)
        raise VMRemoteErrors.new('Expected a string') unless value.is_a? String
        self.setter('load', value)
        sleep(0.2)
    end

    def save(value)
        raise VMRemoteErrors.new('Expected a string') unless value.is_a? String
        self.setter('save', value)
        sleep(0.2)
    end
end
