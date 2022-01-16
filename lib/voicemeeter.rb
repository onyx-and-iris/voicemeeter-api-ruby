require_relative 'routines'

module Voicemeeter
    class Remote < Routines
        def self.make
            ["basic", "banana", "potato"].to_h do |kind|
                [kind, Remote.new(kind)]
            end
        end

        def run
            if block_given?
                yield
                
                logout
            end
        end
    end

    def remote(kind)
        _remotes = Remote.make

        _remotes[kind].login
        return _remotes[kind]
    rescue NoMethodError => error
        raise VMRemoteErrors.new("Unknown Voicemeeter kind")
    end

    module_function :remote
end
