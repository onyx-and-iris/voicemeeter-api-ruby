require_relative 'cbindings'

include CBindings

module RunVM
    '
    Starts Voicemeeter of the Kind requested.
    '
    def start(kind_id)
        unless @@kind_map.key? kind_id
            raise VMRemoteErrors.new('Unknown Voicemeeter Kind.')
        end

        enums =
            @@kinds_all.map.with_index do |kind, i|
                if OS_BITS == 64 && kind.name == 'potato'
                    [kind.name, i + 4]
                else
                    [kind.name, i + 1]
                end
            end
        exes = enums.to_h { |k, v| [k, v.to_i] }

        run_as('runvm', exes[kind_id])
        sleep(1)
    end
end
