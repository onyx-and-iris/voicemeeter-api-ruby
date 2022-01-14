require_relative 'errors'

module Meta_Functions
    def make_accessor_bool(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return !(self.getter("#{param}")).zero?
            end
            define_singleton_method("#{param}=") do |value|
                self.setter("#{param}", value ? 1 : 0)
            end
        end
    end

    def make_accessor_float(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}")
            end
            define_singleton_method("#{param}=") do |arg|
                self.setter("#{param}", arg)
            end
        end
    end

    def make_accessor_string(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}", true)
            end
            define_singleton_method("#{param}=") do |arg|
                self.setter("#{param}", arg)
            end
        end
    end

    def make_reader_only(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}")
            end
        end
    end

    def make_writer_only(*params)
        params.each do |param|
            define_singleton_method("#{param}") do |arg=1|
                self.setter("#{param}", arg)
            end
        end
    end

    def _make_channel_props(num_A, num_B)
        channels = (1..(num_A + num_B)).map.each_with_index do |i|
            i <= num_A ? "A#{i}" : "B#{i - num_A}"
        end

        self.make_accessor_bool *channels
    end
end

module Vban_Meta_Functions
    include Meta_Functions

    def make_reader_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                case param
                when :bit
                    return self.getter("#{param}").to_i == 1 ? 16 : 24
                else
                    return self.getter("#{param}").to_i
                end
            end
        end
    end

    def make_accessor_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                case param
                when :bit
                    return self.getter("#{param}").to_i == 1 ? 16 : 24
                else
                    return self.getter("#{param}").to_i
                end
            end
            define_singleton_method("#{param}=") do |value|
                case param
                when :sr
                    opts = 
                    [11025, 16000, 22050, 24000, 32000, 44100, 48000,
                     64000, 88200, 96000]
                    raise OutOfBoundsErrors.new(opts) unless opts.include? value
                    self.setter("#{param}", value)
                when :channel
                    opts = *(1..8)
                    raise OutOfBoundsErrors.new(opts) unless opts.include? value
                    self.setter("#{param}", value)
                when :bit
                    opts = [16, 24]
                    raise OutOfBoundsErrors.new(opts) unless opts.include? value
                    self.setter("#{param}", value == 16 ? 1 : 2)
                when :quality
                    opts = *(0..4)
                    raise OutOfBoundsErrors.new(opts) unless opts.include? value
                    self.setter("#{param}", value)
                when :route
                    opts = *(0..8)
                    raise OutOfBoundsErrors.new(opts) unless opts.include? value
                    self.setter("#{param}", value)
                end
            end
        end
    end
end
