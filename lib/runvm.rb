require_relative 'base'

include Base

module RunVM
    def run_voicemeeter(kind)
        enums = ["basic", "banana", "potato"].map.each_with_index do |val, i|
            get_arch == 64 && val == "potato" ? [val, i+4] : [val, i+1]
        end
        exes = enums.each.to_h { |k, v| [k, v.to_i] }

        send('vmr_runvm', exes[kind])
        sleep(1)
    end
end
