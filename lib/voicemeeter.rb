require_relative 'base'

module Voicemeeter
    include RunVM

    private

    class Remote < Base
        include Kinds
        '
        Remote class, subclasses Base

        Console layout built according to a kind

        Offers a run method for resource closure.
        '
        def self.make(**kwargs)
            '
            Factory function that generates a Remote class for each kind.

            Returns a hash of Remote classes.
            '
            Kinds.kinds_all.to_h do |kind|
                [kind.name, Remote.new(kind, **kwargs)]
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
        '
        Request a Remote class of a kind and login to the API
        '
        _remotes = Remote.make(**kwargs)

        unless _remotes.key? kind_id
            raise VMRemoteErrors.new('Unknown Voicemeeter Kind.')
        end

        _remotes[kind_id].login
        return _remotes[kind_id]
    end

    def self.testing
        '
        Returns a random Remote class
        '
        unless ENV['RACK_ENV'] == 'dev'
            raise VMRemoteErrors.new('Not in developer mode')
        end

        return Remote.new(Kinds.kinds_all.sample)
    end

    module_function :start
end
