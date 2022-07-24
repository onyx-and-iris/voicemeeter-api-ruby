require "voicemeeter/iremote"

module Voicemeeter
  class Bus < IRemote
    "
    Concrete Bus class
    "
    include Channel_Meta_Functions
    include Mixins::Fades
    include Mixins::XY
    include Mixins::FX

    attr_accessor :mode, :levels

    def self.make(remote, layout_bus)
      "
      Factory function for Bus classes.
      "
      p_out, v_out = layout_bus.values
      (0...(p_out + v_out)).map do |i|
        i < p_out ? PhysicalBus.new(remote, i) : VirtualBus.new(remote, i)
      end
    end

    def initialize(remote, i)
      super
      self.make_accessor_bool :mute, :mono, :eq, :eq_ab, :sel, :monitor
      self.make_accessor_float :gain
      self.make_accessor_string :label

      @mode = BusModes.new(remote, i)
      @levels = BusLevels.new(remote, i)
    end

    def identifier
      "bus[#{@index}]"
    end
  end

  class PhysicalBus < Bus
    def initialize(remote, i)
      super
      self.make_reader_only :device, :sr
    end
  end

  class VirtualBus < Bus
  end

  class BusModes < IRemote
    include Channel_Meta_Functions

    def initialize(remote, i)
      super
      self.make_bus_modes :normal,
                          :amix,
                          :bmix,
                          :repeat,
                          :composite,
                          :tvmix,
                          :upmix21,
                          :upmix41,
                          :upmix61,
                          :centeronly,
                          :lfeonly,
                          :rearonly
    end

    def identifier
      "bus[#{@index}].mode"
    end
  end

  class BusLevels < IRemote
    def initialize(remote, i)
      super
      @init = i * 8
      @offset = 8
    end

    def identifier
      "bus[#{@index}]"
    end

    def getter(mode)
      if @remote.running
        vals = @remote.cache["bus_level"][@init, @offset]
      else
        vals = (@init...@offset).map { |i| @remote.get_level(mode, i) }
      end
      vals.map { |x| x > 0 ? (20 * Math.log(x, 10)).round(1) : -200.0 }
    end

    def all
      getter(3)
    end

    def isdirty? = @remote._bus_comp[@init, @offset].any?
  end
end
