require_relative 'meta'
require_relative 'errors'

class IVban
    '
    Base Vban class
    '
    include Vban_Meta_Functions

    def initialize(remote, index)
        @remote = remote
        @index = index
    end

    def getter(param, is_string = false)
        @remote.get_parameter("#{self.cmd}.#{param}", is_string)
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        "#{self.identifier}.#{self.direction}stream[#{@index}]"
    end

    def direction
        raise 'Called abstract mehod: direction'
    end

    def set_multi(param_hash)
        param_hash.each { |(key, val)| self.send("#{key}=", val) }
    end
end

class Vban < IVban
    '
    Concrete Vban class
    '
    def self.make(remote, vban_streams)
        '
        Factory function for Vban class.

        Returns a mixin of instream/outstream subclasses
        '
        class << self
            attr_accessor :instream, :outstream, :remote

            def enable
                @remote.set_parameter('vban.enable', 1)
            end
            def disable
                @remote.set_parameter('vban.enable', 0)
            end
        end

        vban_in, vban_out = vban_streams.values
        self.instream = (0...vban_in).map { |i| VbanInstream.new(remote, i) }
        self.outstream = (0...vban_out).map { |i| VbanOutstream.new(remote, i) }

        self.remote = remote
        return self
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :on
        self.make_accessor_string :name, :ip
        self.make_accessor_int :quality, :route
    end

    def identifier
        :vban
    end
end

class VbanInstream < Vban
    '
    A subclass representing a VBAN Instream
    '
    def initialize(remote, i)
        super
        self.make_reader_int :sr, :channel, :bit
    end

    def direction
        :in
    end
end

class VbanOutstream < Vban
    '
    A subclass representing a VBAN Outstream
    '
    def initialize(remote, i)
        super
        self.make_accessor_int :sr, :channel, :bit
    end

    def direction
        :out
    end
end
