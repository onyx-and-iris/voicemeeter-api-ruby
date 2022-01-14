require_relative 'channel'


class Strip < IChannel
	def self.make(remote, layout_strip, out_channels)
        "
        Factory function for Strip classes.
        "
        p_in = layout_strip[:p_in]
        v_in = layout_strip[:v_in]
        num_A = out_channels[:p_out]
        num_B = out_channels[:v_out]

        strip = []
        (0..(p_in + v_in -1)).each_with_index do |i|
            if i < p_in
                strip[i] = PhysicalStrip.new(remote, i, num_A, num_B)
            else
                strip[i] = VirtualStrip.new(remote, i, num_A, num_B)
            end
        end
        strip
	end

    def initialize(remote, index, num_A, num_B)
        super(remote, index)

        self.make_accessor_bool :solo

        _make_channel_props(num_A, num_B)
    end

    def cmd
        return "Strip[#{@index}]"
    end

    def _make_channel_props(num_A, num_B)
        channels = []
        (1..(num_A + num_B)).each do |i|
            if i <= num_A
                channels[i] = "A#{i}"
            else
                channels[i] = "B#{i - num_A}"
            end
        end

        self.make_accessor_bool *channels
    end
end

class PhysicalStrip < Strip; end
class VirtualStrip < Strip; end