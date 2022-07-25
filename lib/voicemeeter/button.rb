require_relative "iremote"
require_relative "meta"

module Voicemeeter
  class MacroButton < IRemote
    include MacroButton_Meta_Functions

    def self.make(remote, num_buttons)
      (0...num_buttons).map { |i| MacroButton.new(remote, i) }
    end

    def initialize(remote, i)
      super
      self.make_accessor_macrobutton :state, :stateonly, :trigger
    end

    def getter(mode)
      @remote.get_buttonstatus(@index, mode)
    end

    def setter(set, mode)
      @remote.set_buttonstatus(@index, set, mode)
    end
  end
end
