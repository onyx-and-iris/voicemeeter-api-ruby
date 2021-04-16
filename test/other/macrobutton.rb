require 'routines'

vmr = Remote.new

vmr.run do
    vmr.button[1].state = true
    sleep(0.1)
    vmr.button[1].state = false
    sleep(0.1)
    vmr.button[1].stateonly = true
    sleep(0.1)
    vmr.button[1].stateonly = false
    sleep(0.1)
    vmr.button[1].trigger = true
    sleep(0.1)
    vmr.button[1].trigger = false
end