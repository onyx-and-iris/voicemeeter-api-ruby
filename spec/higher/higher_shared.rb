RSpec.shared_context 'strip, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        @vmr.strip[index].send("#{param}=", val)
    end

    def when_get(param)
        @vmr.strip[index].send("#{param}")
    end
end

RSpec.shared_context 'bus, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        @vmr.bus[index].send("#{param}=", val)
    end

    def when_get(param)
        @vmr.bus[index].send("#{param}")
    end
end

RSpec.shared_context 'macrobutton, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        @vmr.button[index].send("#{param}=", val)
    end

    def when_get(param)
        @vmr.button[index].send("#{param}")
    end
end

RSpec.shared_context 'command, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        @vmr.command.send("#{param}=", val)
    end

    def when_get(param)
        @vmr.command.send("#{param}")
    end
end

RSpec.shared_context 'vban.instream, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        @vmr.vban.instream[index].send("#{param}=", val)
    end

    def when_get(param)
        @vmr.vban.instream[index].send("#{param}")
    end
end

RSpec.shared_context 'vban.outstream, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        @vmr.vban.outstream[index].send("#{param}=", val)
    end

    def when_get(param)
        @vmr.vban.outstream[index].send("#{param}")
    end
end

RSpec.shared_context 'recorder, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        @vmr.recorder.send("#{param}=", val)
    end

    def when_get(param)
        @vmr.recorder.send("#{param}")
    end
end

RSpec.configure do |rspec|
    rspec.include_context 'strip, set and get higher', include_shared: true
    rspec.include_context 'bus, set and get higher', include_shared: true
    rspec.include_context 'macrobutton, set and get higher',
                          include_shared: true
    rspec.include_context 'command, set and get higher', include_shared: true
    rspec.include_context 'vban.instream, set and get higher',
                          include_shared: true
    rspec.include_context 'vban.outstream, set and get higher',
                          include_shared: true
    rspec.include_context 'recorder, set and get higher', include_shared: true
end
