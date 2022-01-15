require_relative 'channel'


class Bus < IChannel
    def self.make(remote, layout_bus)
        "
        Factory function for Bus classes.
        "
        p_out = layout_bus[:p_out]
        v_out = layout_bus[:v_out]
        
        (0...(p_out + v_out)).map.each do |i|
            i < p_out ? \
            PhysicalBus.new(remote, i) : \
            VirtualBus.new(remote, i)
        end
    end

    def cmd
        return "Bus[#{@index}]"
    end

    def eq
        return !(self.getter("EQ.on")).zero?
    end

    def eq=(value)
        self.setter("EQ.on", value ? 1 : 0)
    end
end

class PhysicalBus < Bus; end
class VirtualBus < Bus; end
