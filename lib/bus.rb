require_relative 'channel'

class Bus < IChannel
    '
    Concrete Bus class
    '
    include Fades

    attr_accessor :mode

    def self.make(remote, layout_bus)
        '
        Factory function for Bus classes.
        '
        p_out, v_out = layout_bus.values
        (0...(p_out + v_out)).map do |i|
            i < p_out ? PhysicalBus.new(remote, i) : VirtualBus.new(remote, i)
        end
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :mute, :mono, :eq
        self.make_accessor_float :gain
        self.make_accessor_string :label

        @mode = BusModes.new(remote, i)
    end

    def identifier
        :bus
    end
end

class PhysicalBus < Bus
end
class VirtualBus < Bus
end

class BusModes < IChannel
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
        :bus
    end

    def cmd
        "#{super}.mode"
    end
end
