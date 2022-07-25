require_relative "iremote"
require_relative "meta"

module Voicemeeter
  class Command < IRemote
    include Commands_Meta_Functions

    def initialize(remote)
      super
      self.make_action_prop :show, :restart, :shutdown
      self.make_writer_bool :showvbanchat, :lock
    end

    def identifier
      :command
    end

    def hide
      self.setter("show", 0)
    end

    def load(value)
      raise VMRemoteErrors.new("Expected a string") unless value.is_a? String
      self.setter("load", value)
      sleep(0.2)
    end

    def save(value)
      raise VMRemoteErrors.new("Expected a string") unless value.is_a? String
      self.setter("save", value)
      sleep(0.2)
    end

    def reset
      @remote.set_config("reset")
    end
  end
end
