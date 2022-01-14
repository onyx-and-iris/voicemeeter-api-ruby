require_relative 'meta'


class ICommand
    include Meta_Functions

    attr_accessor :remote

    def initialize(remote)
        self.remote = remote

        self.make_writer_only :show, :restart, :reset
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        return "command"
    end
end


class Command < ICommand
    def showvbanchat
        self.setter("DialogShow.VBANCHAT")
    end
end
