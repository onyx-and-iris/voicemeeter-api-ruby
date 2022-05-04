require_relative '../vmr'

include VMUnit

RSpec.shared_context 'strip, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.strip[index].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.strip[index].send("#{param}")
    end
end

RSpec.shared_context 'strip.gainlayer, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.strip[index].gainlayer[j].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.strip[index].gainlayer[j].send("#{param}")
    end
end

RSpec.shared_context 'bus, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.bus[index].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.bus[index].send("#{param}")
    end
end

RSpec.shared_context 'macrobutton, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.button[index].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.button[index].send("#{param}")
    end
end

RSpec.shared_context 'command, set and get higher', shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.command.send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.command.send("#{param}")
    end
end

RSpec.shared_context 'vban.instream, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.vban.instream[index].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.vban.instream[index].send("#{param}")
    end
end

RSpec.shared_context 'vban.outstream, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.vban.outstream[index].send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.vban.outstream[index].send("#{param}")
    end
end

RSpec.shared_context 'recorder, set and get higher',
                     shared_context: :metadata do
    def does_set(param, val)
        VMUnit.testing.recorder.send("#{param}=", val)
    end

    def when_get(param)
        VMUnit.testing.recorder.send("#{param}")
    end
end

RSpec.configure do |rspec|
    rspec.include_context 'strip, set and get higher', include_shared: true
    rspec.include_context 'strip.gainlayer, set and get higher', include_shared: true
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
