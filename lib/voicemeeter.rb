require_relative 'base'
require_relative 'strip'
require_relative 'bus'
require_relative 'button'
require_relative 'vban'
require_relative 'command'
require_relative 'recorder'
require_relative 'device'

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
        def initialize(kind, **kwargs)
            super
            self.strip = Strip.make(self, kind.layout[:strip])
            self.bus = Bus.make(self, kind.layout[:bus])
            self.button = MacroButton.make(self, kind.layout[:mb])
            self.vban = Vban.new(self, kind.layout[:vban])
            self.command = Command.new(self)
            self.recorder = Recorder.new(self)
            self.device = Device.new(self)
        end

        def run
            '
            Handles login/logout

            Starts/stops the observable thread.
            '
            login
            init_thread

            yield if block_given?
        ensure
            end_thread
            logout
        end
    end

    public

    def self.remote(kind_id, **kwargs)
        '
        Factory method for remotes.

        Creates a hash of remote classes, one for each kind.

        Handles kind_id request errors.

        Returns a remote class of the kind requested.
        '
        _remotes =
            Kinds.kinds_all.to_h do |kind|
                [kind.name.to_s, Remote.new(kind, **kwargs)]
            end

        unless _remotes.key? kind_id
            raise VMRemoteErrors.new('Unknown Voicemeeter Kind.')
        end
        _remotes[kind_id]
    end

    def self.testing
        '
        Returns a random Remote class
        '
        unless ENV['RACK_ENV'] == 'dev'
            raise VMRemoteErrors.new('Not in developer mode')
        end

        Remote.new(Kinds.kinds_all.sample)
    end

    module_function :start
end
