require "voicemeeter/cbindings"
require "voicemeeter/kinds"

module Voicemeeter
  module RunVM
    "
    Starts Voicemeeter of the Kind requested.
    "
    include CBindings
    include Kinds

    def start(kind_id)
      unless Kinds.kind_map.key? kind_id
        raise VMRemoteErrors.new("Unknown Voicemeeter Kind.")
      end

      enums =
        Kinds.kinds_all.map.with_index do |kind, i|
          if CBindings::OS_BITS == 64 && kind.name.to_s == "potato"
            [kind.name.to_s, i + 4]
          else
            [kind.name.to_s, i + 1]
          end
        end
      exes = enums.to_h { |k, v| [k, v.to_i] }

      CBindings.vm_runvm(exes[kind_id])
      sleep(1)
    end
  end
end
