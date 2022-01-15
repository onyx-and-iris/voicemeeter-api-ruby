require_relative 'channel'


class Strip < IChannel
    attr_reader :num_A, :num_B

    def self.make(remote, layout_strip, out_channels)
        "
        Factory function for Strip classes.
        "
        p_in = layout_strip[:p_in]
        v_in = layout_strip[:v_in]
        num_A = out_channels[:p_out]
        num_B = out_channels[:v_out]

        strip = (0...(p_in + v_in)).map.each do |i|
            i < p_in ? \
            PhysicalStrip.new(remote, i, num_A, num_B) : \
            VirtualStrip.new(remote, i, num_A, num_B) 
        end
    end

    def initialize(remote, index, num_A, num_B)
        super(remote, index)

        self.make_accessor_bool :solo

        _make_channel_props(num_A, num_B)
    end

    def cmd
        return "Strip[#{@index}]"
    end
end

class PhysicalStrip < Strip; end
class VirtualStrip < Strip; end
