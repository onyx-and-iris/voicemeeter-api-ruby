require_relative 'channel'


class Strip < IChannel
    """
    Concrete class for Strip objects
    """
    def self.make(remote, layout_strip)
        "
        Factory function for Strip classes.
        "
        p_in, v_in = layout_strip.map { |k, v| v }
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
        self.make_accessor_int :limit, :k
        self.make_accessor_string :label

        num_A, num_B = remote.kind.layout[:bus].map { |k, v| v }
        self.make_accessor_bool *make_channel_props(num_A, num_B)
    end

    def identifier
        return :strip
    end

    def cmd
        return "#{self.identifier}[#{@index}]"
    end
end

class PhysicalStrip < Strip
    def initialize(remote, i)
        super
        self.make_accessor_float :comp, :gate
        self.make_reader_only :device, :sr
    end
end

class VirtualStrip < Strip
    def initialize(remote, i)
        super
        self.make_accessor_bool :mc
    end
end
