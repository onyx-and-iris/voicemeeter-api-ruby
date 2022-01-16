require_relative 'meta'


class ICommand
    include Commands_Meta_Functions

    attr_accessor :remote

    def initialize(remote)
        self.remote = remote
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        return "command"
    end
end


class Command < ICommand
    def initialize(remote)
        super
        self.make_writer_only :show, :restart, :reset, :shutdown
        self.make_writer_bool :showvbanchat, :lock
    end

    def save(value)
        raise VMRemoteErrros.new("Expected a string") unless value.is_a? String
        self.setter("save", value)
        sleep(0.2)
    end

    def load(value)
        raise VMRemoteErrros.new("Expected a string") unless value.is_a? String
        self.setter("load", value)
        sleep(0.2)
    end
end
