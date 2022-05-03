require 'voicemeeter'

kind_id = 'banana'

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vmr = Voicemeeter.remote(kind_id)

# vmr.run accepts a block
vmr.run do
    # mute the leftmost strip
    vmr.strip[0].mute = true
    puts vmr.strip[0].mute

    # disable eq for second from left bus
    vmr.bus[1].eq = false
    puts vmr.bus[1].eq
end
