require_relative 'channel'


class Bus < IChannel
	def self.make(remote, layout_bus)
        "
        Factory function for Strip classes.
        "
        p_out = layout_bus[:p_out]
        v_out = layout_bus[:v_out]

        bus = []
        (0..(p_out + v_out - 1)).each_with_index do |index|
            if index < p_out
                bus[index] = PhysicalBus.new(remote, index)
            else
                bus[index] = VirtualBus.new(remote, index)
            end
        end
        bus
	end

    def initialize(remote, index)
        super(remote, index)
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