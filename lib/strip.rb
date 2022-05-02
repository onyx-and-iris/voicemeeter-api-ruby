require_relative 'channel'

class Strip < IChannel
    '
    Concrete Strip class
    '
    def self.make(remote, layout_strip)
        '
        Factory function for Strip classes.
        '
        p_in, v_in = layout_strip.values
        (0...(p_in + v_in)).map do |i|
            if i < p_in
                PhysicalStrip.new(remote, i)
            else
                VirtualStrip.new(remote, i)
            end
        end
    end

    def initialize(remote, i)
        super
        self.make_accessor_bool :solo, :mute, :mono
        self.make_accessor_float :gain
        self.make_accessor_int :limit
        self.make_accessor_string :label

        num_A, num_B = remote.kind.layout[:bus].values
        self.make_accessor_bool *make_channel_props(num_A, num_B)
    end

    def identifier
        :strip
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
        self.make_accessor_int :k
    end
end
