require_relative "iremote"
require_relative "mixin"

class Strip < IRemote
  "
  Concrete Strip class
  "
  include Channel_Meta_Functions
  include Fades

  attr_accessor :gainlayer, :levels

  def self.make(remote, layout_strip)
    "
    Factory function for Strip classes.
    "
    p_in, v_in = layout_strip.values
    (0...(p_in + v_in)).map do |i|
      i < p_in ? PhysicalStrip.new(remote, i) : VirtualStrip.new(remote, i)
    end
  end

  def initialize(remote, i)
    super
    self.make_accessor_bool :solo, :mute, :mono
    self.make_accessor_float :gain
    self.make_accessor_int :limit
    self.make_accessor_string :label

    num_A, num_B = remote.kind.layout[:bus].values
    self.make_accessor_bool *make_channel_props(num_A, num_B)

    @gainlayer = (0...8).map { |j| GainLayer.new(remote, i, j) }
    @levels = StripLevels.new(remote, i)
  end

  def identifier
    "strip[#{@index}]"
  end
end

class PhysicalStrip < Strip
  def initialize(remote, i)
    super
    self.make_accessor_float :comp, :gate, :audibility
    self.make_reader_only :device, :sr
  end
end

class VirtualStrip < Strip
  def initialize(remote, i)
    super
    self.make_accessor_bool :mc
    self.make_accessor_int :k
    self.make_accessor_float :bass, :mid, :treble
  end

  def appgain(name, gain)
    self.setter("AppGain", "(\"#{name}\", #{gain})")
  end

  def appmute(name, mute)
    self.setter("AppMute", "(\"#{name}\", #{mute ? 1 : 0})")
  end
end

class GainLayer < IRemote
  def initialize(remote, i, j)
    super(remote, i)
    @j = j
  end

  def identifier
    "strip[#{@index}]"
  end

  def gain
    self.getter("gainlayer[#{@j}]")
  end

  def gain=(value)
    self.setter("gainlayer[#{@j}]", value)
  end
end

class StripLevels < IRemote
  def initialize(remote, i)
    super
    if i < @remote.p_in
      @init = i * 2
      @offset = 2
    else
      @init = (@remote.p_in * 2) + ((i - @remote.p_in) * 8)
      @offset = 8
    end
  end

  def identifier
    "strip[#{@index}]"
  end

  def get_level(mode)
    if @remote.running
      vals = @remote.cache["strip_level"][@init, @offset]
    else
      vals = (@init...@offset).map { |i| get_level(mode, i) }
    end
    vals.map { |x| x > 0 ? (20 * Math.log(x, 10)).round(1) : -200.0 }
  end

  def prefader
    @remote.strip_mode = 0
    get_level(0)
  end

  def postfader
    @remote.strip_mode = 1
    get_level(1)
  end

  def postmute
    @remote.strip_mode = 2
    get_level(2)
  end

  def isdirty? = @remote._strip_comp[@init, @offset].any?
end
