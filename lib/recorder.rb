require_relative "iremote"
require_relative "meta"

class Recorder < IRemote
  "
  Concrete Recorder class
  "

  def initialize(remote)
    super
    self.make_action_prop :play, :stop, :record, :ff, :rew

    num_A, num_B = remote.kind.layout[:bus].values
    self.make_accessor_bool *make_channel_props(num_A, num_B)
  end

  def identifier
    :recorder
  end
end
