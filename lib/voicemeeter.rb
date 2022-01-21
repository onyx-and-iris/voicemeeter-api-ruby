require_relative 'routines'
require_relative 'errors'


module Voicemeeter
    include RunVM

    private
    class Remote < Routines
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
                [kind, Remote.new(kind, **kwargs)]
            end
        end

        def initialize(kind)
            super
            self.strip = Strip.make(self, @layout[:strip])
            self.bus = Bus.make(self, @layout[:bus])
            self.button = MacroButton.make(self, @layout[:mb])
            self.vban = Vban.make(self, @layout[:vban])
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
    def remote(kind, **kwargs)
        """
        Request a Remote for a specific kind and login to the API
        """
        _remotes = Remote.make(**kwargs)

        raise VMRemoteErrors.new("Unknown Voicemeeter Kind.") unless _remotes.key? kind

        _remotes[kind].login
        return _remotes[kind]
    end

    module_function :remote, :run_voicemeeter
end
