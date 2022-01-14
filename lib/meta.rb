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
