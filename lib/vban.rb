require_relative 'meta'


class IVban
    include Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_bool :on
    end

    def getter(param)
        @remote.get_parameter("#{self.cmd}.#{param}")
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

        self.instream = []
        (0..(vban_streams[:instream] - 1)).each_with_index do |i|
            self.instream[i] = VbanInstream.new(remote, i)
        end
        self.outstream = []
        (0..(vban_streams[:outstream] - 1)).each_with_index do |i|
            self.outstream[i] = VbanOutstream.new(remote, i)
        end

        return self
    end
end

class VbanInstream < Vban
    def direction
        return "in"
    end
end

class VbanOutstream < Vban
    def direction
        return "out"
    end
end
