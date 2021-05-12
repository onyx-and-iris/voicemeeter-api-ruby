require 'voicemeeter'

vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
    vmr.recorder.A1(ON)
    puts vmr.recorder.A1
    sleep(0.1)
    vmr.recorder.A1 = false
    puts vmr.recorder.A1
    sleep(0.1)
    vmr.recorder.A2(ON)
    puts vmr.recorder.A2
    sleep(0.1)
    vmr.recorder.A2(OFF)
    puts vmr.recorder.A2
    sleep(0.1)
    vmr.recorder.A3 = true
    puts vmr.recorder.A3
    sleep(0.1)
    vmr.recorder.A3(OFF)
    puts vmr.recorder.A3

    vmr.recorder.B1(ON)
    puts vmr.recorder.B1
    sleep(0.1)
    vmr.recorder.B1 = false
    puts vmr.recorder.B1
    sleep(0.1)
    vmr.recorder.B2(ON)
    puts vmr.recorder.B2
    sleep(0.1)
    vmr.recorder.B2 = false
    puts vmr.recorder.B2
    sleep(0.1)
end
