require_relative 'cbindings'

include CBindings

module RunVM
    '
    Starts Voicemeeter of the Kind requested.
    '
    def start(kind_id)
        unless $kind_map.keys.include? kind_id
            raise VMRemoteErrors.new('Unknown Voicemeeter Kind.')
        end

        enums =
            $kind_map.keys.map.with_index do |val, i|
                OS_BITS == 64 && val == 'potato' ? [val, i + 4] : [val, i + 1]
            end
        exes = enums.to_h { |k, v| [k, v.to_i] }

        run_as('runvm', exes[kind_id])
        sleep(1)
    end
end
