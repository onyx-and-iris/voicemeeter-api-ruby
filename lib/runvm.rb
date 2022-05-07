require_relative 'cbindings'
require_relative 'kinds'

include CBindings
include Kinds

module RunVM
    '
    Starts Voicemeeter of the Kind requested.
    '
    def start(kind_id)
        unless Kinds.kind_map.key? kind_id
            raise VMRemoteErrors.new('Unknown Voicemeeter Kind.')
        end

        enums =
            Kinds.kinds_all.map.with_index do |kind, i|
                if OS_BITS == 64 && kind.name == 'potato'
                    [kind.name, i + 4]
                else
                    [kind.name, i + 1]
                end
            end
        exes = enums.to_h { |k, v| [k, v.to_i] }

        send(:vmr_runvm, exes[kind_id])
        sleep(1)
    end
end
