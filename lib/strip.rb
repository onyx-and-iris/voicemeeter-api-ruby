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

        (0...(p_in + v_in)).map do |i|
            i < p_in ? \
            PhysicalStrip.new(remote, i, num_A, num_B) : \
            VirtualStrip.new(remote, i, num_A, num_B) 
        end
    end

    def initialize(remote, i, num_A, num_B)
        super(remote, i)
        self.make_accessor_bool :solo, :mute, :mono
        self.make_accessor_float :gain
        self._make_channel_props(num_A, num_B)
    end

    def cmd
        return "Strip[#{@index}]"
    end
end

class PhysicalStrip < Strip
    def initialize(remote, i, num_A, num_B)
        super
        self.make_accessor_float :comp, :gate
        self.make_accessor_int :limit
        self.make_reader_only :device, :sr
    end
end

class VirtualStrip < Strip
    def initialize(remote, i, num_A, num_B)
        super
        self.make_accessor_bool :mc, :k
    end
end
