require_relative 'routines'


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

def get_remote(kind)
    _remotes = Remote.make

    _remotes[kind].login
    return _remotes[kind]
end
