require_relative 'channel'

class Bus < IChannel
    '
    Concrete Bus class
    '
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
    end

    def identifier
        :bus
    end
end

class PhysicalBus < Bus
end
class VirtualBus < Bus
end
