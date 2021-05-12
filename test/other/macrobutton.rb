require 'voicemeeter'

vmr = Remote.new

vmr.run do
    vmr.button[1].state = true
    puts vmr.button[1].state
    sleep(0.1)
    vmr.button[1].state = false
    puts vmr.button[1].state
    sleep(0.1)
    vmr.button[1].stateonly = true
    puts vmr.button[1].stateonly
    sleep(0.1)
    vmr.button[1].stateonly = false
    puts vmr.button[1].stateonly
    sleep(0.1)
    vmr.button[1].trigger = true
    puts vmr.button[1].trigger
    sleep(0.1)
    vmr.button[1].trigger = false
    puts vmr.button[1].trigger
end