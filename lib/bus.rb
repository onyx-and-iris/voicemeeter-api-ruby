require_relative 'channel'


class Bus < IChannel
    def self.make(remote, layout_bus)
        "
        Factory function for Bus classes.
        "
        p_out = layout_bus[:p_out]
        v_out = layout_bus[:v_out]
        
        (0...(p_out + v_out)).map do |i|
            i < p_out ? \
            PhysicalBus.new(remote, i) : \
            VirtualBus.new(remote, i)
        end
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :mute, :mono, :eq
        self.make_accessor_float :gain
    end

    def cmd
        return "Bus[#{@index}]"
    end
end

class PhysicalBus < Bus; end
class VirtualBus < Bus; end
