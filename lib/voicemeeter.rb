require_relative 'routines'
require_relative 'errors'

module Voicemeeter
    class Remote < Routines
        """
        Factory function that generates a remote class for each kind.
        Console layout built according to version definition.

        Offers a run method for resource closure.

        Returns a hash of Remote classes.
        """
        def self.make
            ["basic", "banana", "potato"].to_h do |kind|
                [kind, Remote.new(kind)]
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

    def remote(kind)
        """
        Request a Remote for a specific kind and login to the API
        """
        _remotes = Remote.make
        _kinds_all = _remotes.map { |k,v| k }

        raise VMRemoteErrors.new("Unknown Voicemeeter Kind. Options: #{_kinds_all}") unless _remotes[kind]
        _remotes[kind].login
        return _remotes[kind]
    end

    module_function :remote
end
