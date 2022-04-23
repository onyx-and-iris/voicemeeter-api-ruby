require_relative 'kinds'
require_relative 'base'
require_relative 'errors'


module Voicemeeter
    include Kinds
    include RunVM

    private
    class Remote < Base
        """
        Remote class, subclasses Routines

        Console layout built according to version definition.

        Offers a run method for resource closure.
        """
        def self.make(**kwargs)
            """
            Factory function that generates a remote class for each kind.

            Returns a hash of Remote classes.
            """
            $kinds_all.to_h do |kind|
                [kind.properties[:name], Remote.new(kind, **kwargs)]
            end
        end

        def initialize(kind)
            super
            self.strip = Strip.make(self, kind.layout[:strip])
            self.bus = Bus.make(self, kind.layout[:bus])
            self.button = MacroButton.make(self, kind.layout[:mb])
            self.vban = Vban.make(self, kind.layout[:vban])
            self.command = Command.new(self)
            self.recorder = Recorder.new(self)
        end

        def run
            yield if block_given?
            
        ensure
            logout
        end
    end

    public
    def self.remote(kind_id, **kwargs)
        """
        Request a Remote of a kind and login to the API
        """
        _remotes = Remote.make

        raise VMRemoteErrors.new("Unknown Voicemeeter Kind.") unless _remotes.key? kind_id

        _remotes[kind_id].login
        return _remotes[kind_id]
    end

    def self.testing
        raise VMRemoteErrors.new("Not in developer mode") unless ENV['RACK_ENV'] == 'dev'
        return Remote.new(Kinds.get_kind("banana"))
    end

    module_function :start
end
