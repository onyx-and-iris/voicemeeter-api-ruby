RSpec.shared_context 'strip, set and get lower', shared_context: :metadata do
    def does_set(param, val)
        @vmr.set_parameter("Strip[#{index}].#{param}", val)
    end

    def when_get(param, string = false)
        @vmr.get_parameter("Strip[#{index}].#{param}", string)
    end
end

RSpec.shared_context 'bus, set and get lower', shared_context: :metadata do
    def does_set(param, val)
        @vmr.set_parameter("Bus[#{index}].#{param}", val)
    end

    def when_get(param, string = false)
        @vmr.get_parameter("Bus[#{index}].#{param}", string)
    end
end

RSpec.shared_context 'macrobutton, set and get lower',
                     shared_context: :metadata do
    def does_set(val, mode)
        @vmr.set_buttonstatus(index, val, mode)
    end

    def when_get(mode)
        @vmr.get_buttonstatus(index, mode)
    end
end

RSpec.configure do |rspec|
    rspec.include_context 'strip, set and get lower', include_shared: true
    rspec.include_context 'bus, set and get lower', include_shared: true
    rspec.include_context 'macrobutton, set and get lower', include_shared: true
end
