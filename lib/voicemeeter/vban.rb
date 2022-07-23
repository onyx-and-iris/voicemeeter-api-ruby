require "voicemeeter/iremote"
require "voicemeeter/meta"
require "voicemeeter/errors"

module Voicemeeter
  class VbanStream < IRemote
    "
    A class representing a VBAN stream
    "
    include Vban_Meta_Functions

    def initialize(remote, i)
      super
      self.make_accessor_bool :on
      self.make_accessor_string :name, :ip
      self.make_accessor_int :quality, :route
    end

    def identifier
      "vban.#{self.direction}stream[#{@index}]"
    end

    def direction
      raise "Called abstract mehod: direction"
    end
  end

  class VbanInstream < VbanStream
    "
    A subclass representing a VBAN Instream
    "
    def initialize(remote, i)
      super
      self.make_reader_int :sr, :channel, :bit
    end

    def direction
      :in
    end
  end

  class VbanOutstream < VbanStream
    "
    A subclass representing a VBAN Outstream
    "
    def initialize(remote, i)
      super
      self.make_accessor_int :sr, :channel, :bit
    end

    def direction
      :out
    end
  end

  class Vban
    attr_accessor :instream, :outstream

    def initialize(remote, vban_streams)
      "
      Initializes a Vban class

      Creates an array for each in/out stream
      "
      vban_in, vban_out = vban_streams.values
      self.instream = (0...vban_in).map { |i| VbanInstream.new(remote, i) }
      self.outstream = (0...vban_out).map { |i| VbanOutstream.new(remote, i) }

      @remote = remote
    end

    def enable
      @remote.set_parameter("vban.enable", 1)
    end

    def disable
      @remote.set_parameter("vban.enable", 0)
    end
  end
end
