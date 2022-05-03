require_relative 'meta'
require_relative 'errors'

class IChannel
    '
    Base Channel class
    '
    include Channel_Meta_Functions

    def initialize(remote, i)
        @remote = remote
        @index = i
    end

    def getter(param, is_string = false)
        @remote.get_parameter("#{self.cmd}.#{param}", is_string)
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        "#{self.identifier}[#{@index}]"
    end

    def identifier
        raise 'Called abstract mehod: identifier'
    end

    def set_multi(param_hash)
        param_hash.each { |(key, val)| self.send("#{key}=", val) }
    end
end

module Fades
    def fadeto(target, time)
        self.setter('FadeTo', "(#{target}, #{time})")
        sleep(@remote.delay)
    end

    def fadeby(change, time)
        self.setter('FadeBy', "(#{change}, #{time})")
        sleep(@remote.delay)
    end
end
