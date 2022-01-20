require_relative 'routines'
require_relative 'errors'

module Voicemeeter
    class Remote < Routines
        def self.make
            ["basic", "banana", "potato"].to_h do |kind|
                [kind, Remote.new(kind)]
            end
        end

        def initialize(kind)
            super
            self.strip = Strip.make(self, @layout[:strip], @layout[:bus])
            self.bus = Bus.make(self, @layout[:bus])
            self.button = MacroButton.make(self, @layout[:mb])
            self.vban = Vban.make(self, @layout[:vban])
            self.command = Command.new(self)
            self.recorder = Recorder.new(self, @layout[:bus])
        end

        def run
            yield if block_given?
            
        ensure
            logout
        end
    end

    def remote(kind)
        _remotes = Remote.make

        raise VMRemoteErrors.new("Unknown Voicemeeter Kind") unless _remotes[kind]
        _remotes[kind].login
        return _remotes[kind]
    end

    module_function :remote
end
