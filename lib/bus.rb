require_relative 'channel'

class Bus < IChannel
    '
    Concrete class for Bus objects
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
        return :bus
    end

    def cmd
        return "#{self.identifier}[#{@index}]"
    end
end

class PhysicalBus < Bus
end
class VirtualBus < Bus
end
