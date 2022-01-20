require_relative 'channel'


class Strip < IChannel
    """
    Concrete class for Strip objects
    """
    attr_reader :num_A, :num_B

    def self.make(remote, layout_strip)
        "
        Factory function for Strip classes.
        "
        p_in = layout_strip[:p_in]
        v_in = layout_strip[:v_in]

        (0...(p_in + v_in)).map do |i|
            i < p_in ? \
            PhysicalStrip.new(remote, i) : \
            VirtualStrip.new(remote, i) 
        end
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :solo, :mute, :mono
        self.make_accessor_float :gain
        self.make_accessor_string :label

        num_A, num_B = remote.layout[:bus].map { |k, v| v }
        self.make_accessor_bool *make_channel_props(num_A, num_B)
    end

    def cmd
        return "Strip[#{@index}]"
    end
end

class PhysicalStrip < Strip
    def initialize(remote, i)
        super
        self.make_accessor_float :comp, :gate
        self.make_accessor_int :limit
        self.make_reader_only :device, :sr
    end
end

class VirtualStrip < Strip
    def initialize(remote, i)
        super
        self.make_accessor_bool :mc, :k
    end
end
