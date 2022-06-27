require 'voicemeeter'

kind_id = 'banana'

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vm = Voicemeeter.remote(kind_id)

# vm.run accepts a block
vm.run do
    # mute the leftmost strip
    vm.strip[0].mute = true
    puts vm.strip[0].mute

    # disable eq for second from left bus
    vm.bus[1].eq = false
    puts vm.bus[1].eq
end
