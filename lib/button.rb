require_relative 'meta'

class IMacroButton
    include MacroButton_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index
    end

    def getter(mode)
        return @remote.macro_getstatus(@index, mode)
    end

    def setter(set, mode)
        @remote.macro_setstatus(@index, set, mode)
    end

    def set_multi(param_hash)
        param_hash.each { |(key, val)| self.send("#{key}=", val) }
        sleep(remote.delay)
    end
end

class MacroButton < IMacroButton
    def self.make(remote, num_buttons)
        (0...num_buttons).map { |i| MacroButton.new(remote, i) }
    end

    def initialize(remote, i)
        super
        self.make_accessor_macrobutton :state, :stateonly, :trigger
    end
end
