require_relative 'meta'
require_relative 'errors'


class IVban
    """
    Base class for Vban objects
    """
    include Vban_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index
    end

    def getter(param, is_string=false)
        @remote.get_parameter("#{self.cmd}.#{param}", is_string)
    end

    def setter(param, value)
        @remote.set_parameter("#{self.cmd}.#{param}", value)
    end

    def identifier
        return :vban
    end

    def cmd
        return "#{self.identifier}.#{self.direction}stream[#{@index}]"
    end

    def direction
        raise NotImplementedError
    end

    def set_multi(param_hash)
        param_hash.each do |(key,val)|
            self.send("#{key}=", val)
        end
    end
end


class Vban < IVban
    """
    Concrete class for Vban objects
    """
    def self.make(remote, vban_streams)
        "
        Factory function for Vban class.

        Returns a mixin of instream/outstream subclasses
        "
        class << self
            attr_accessor :instream, :outstream, :remote

            def enable
                @remote.set_parameter("vban.enable", 1)
            end
            def disable
                @remote.set_parameter("vban.enable", 0)
            end
        end

        self.instream = 
        (0...vban_streams[:instream]).map do |i|
            VbanInstream.new(remote, i)
        end
        self.outstream = 
        (0...vban_streams[:outstream]).map do |i|
            VbanOutstream.new(remote, i)
        end

        self.remote = remote
        return self
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :on
        self.make_accessor_string :name, :ip
        self.make_accessor_int :quality, :route
    end
end


class VbanInstream < Vban
    def initialize(remote, i)
        super
        self.make_reader_int :sr, :channel, :bit
    end

    def direction
        return :in
    end
end


class VbanOutstream < Vban
    def initialize(remote, i)
        super
        self.make_accessor_int :sr, :channel, :bit
    end

    def direction
        return :out
    end
end
