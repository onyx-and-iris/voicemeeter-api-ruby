require_relative 'meta'


class IVban
    include Vban_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_bool :on
        self.make_accessor_string :name, :ip
        self.make_accessor_int :quality, :route
    end

    def getter(param, is_string=false)
        @remote.get_parameter("#{self.cmd}.#{param}", is_string)
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def cmd
        return "vban.#{self.direction}stream[#{@index}]"
    end

    def direction
        raise NotImplementedError
    end
end


class Vban < IVban
    def self.make(remote, vban_streams)
        "
        Factory function for Vban class.

        Returns a mixin of instream/outstream subclasses
        "
        class << self
            attr_accessor :instream, :outstream
        end

        self.instream = 
        (0...vban_streams[:instream]).map.each_with_index do |i|
            VbanInstream.new(remote, i)
        end
        self.outstream = 
        (0...vban_streams[:outstream]).map.each_with_index do |i|
            VbanOutstream.new(remote, i)
        end

        return self
    end
end

class VbanInstream < Vban
    def initialize(remote, i)
        super
        self.make_reader_int :sr, :channel, :bit
    end

    def direction
        return "in"
    end
end

class VbanOutstream < Vban
    def initialize(remote, i)
        super
        self.make_accessor_int :sr, :channel, :bit
    end

    def direction
        return "out"
    end
end
