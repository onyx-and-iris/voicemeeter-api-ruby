require 'routines'

vmr = Remote.new

vmr.run do
    vmr.button[0].state = 1
    sleep(0.1)
    vmr.button[0].state = 0
    sleep(0.1)
    vmr.button[0].stateonly = 1
    sleep(0.1)
    vmr.button[0].stateonly = 0
    sleep(0.1)
    vmr.button[0].trigger = 1
    sleep(0.1)
    vmr.button[0].trigger = 0
end