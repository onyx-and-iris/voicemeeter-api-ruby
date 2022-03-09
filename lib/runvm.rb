require_relative 'base'

include Base

module RunVM
    """
    Starts Voicemeeter of the Kind requested.
    """
    def start(kind)
        raise VMRemoteErrors.new("Unknown Voicemeeter Kind.") unless $kinds_all.include? kind
        bits = get_arch
        
        enums = $kinds_all.map.with_index do |val, i|
            bits == 64 && val == "potato" ? [val, i+4] : [val, i+1]
        end
        exes = enums.to_h { |k, v| [k, v.to_i] }

        run_as('runvm', exes[kind])
        sleep(1)
    end
end
