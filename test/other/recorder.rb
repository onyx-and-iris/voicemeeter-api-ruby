require 'routines'

vmr = Remote.new

vmr.run do

    puts "RECORDING"
    vmr.recorder.record
    sleep(10)
    puts "STOP"
    vmr.recorder.stop
    sleep(1)
    puts "PLAY"
    vmr.recorder.play
    sleep(5)
    puts "STOP"
    vmr.recorder.stop
    sleep(1)

    vmr.recorder.A1 = 1
    sleep(0.1)
    vmr.recorder.A1 = 0
    sleep(0.1)
    vmr.recorder.A2 = 1
    sleep(0.1)
    vmr.recorder.A2 = 0
    sleep(0.1)
    vmr.recorder.A3 = 1
    sleep(0.1)
    vmr.recorder.A3 = 0

    vmr.recorder.B1 = 1
    sleep(0.1)
    vmr.recorder.B1 = 0
    sleep(0.1)
    vmr.recorder.B2= 1
    sleep(0.1)
    vmr.recorder.B2 = 0
end
