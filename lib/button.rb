require_relative 'meta'


class IMacroButton
    include MacroButton_Meta_Functions

    attr_accessor :remote, :index

    def initialize(remote, index)
        self.remote = remote
        self.index = index

        self.make_accessor_macrobutton :state, :stateonly, :trigger 
    end

    def getter(mode)
        return @remote.macro_getstatus(@index, mode)
    end

    def setter(set, mode)
        @remote.macro_setstatus(@index, set, mode)
    end
end


class MacroButton < IMacroButton
    def self.make(remote, num_buttons)
        button = (0...num_buttons).map.each do |i|
            MacroButton.new(remote, i)
        end
    end
end