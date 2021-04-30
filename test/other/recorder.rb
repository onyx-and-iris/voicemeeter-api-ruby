require 'voicemeeter'

vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
=begin
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
=end
    vmr.recorder.A1(ON)
    sleep(0.1)
    vmr.recorder.A1 = false
    sleep(0.1)
    vmr.recorder.A2(ON)
    sleep(0.1)
    vmr.recorder.A2(OFF)
    sleep(0.1)
    vmr.recorder.A3 = true
    sleep(0.1)
    vmr.recorder.A3(OFF)

    vmr.recorder.B1(ON)
    sleep(0.1)
    vmr.recorder.B1 = false
    sleep(0.1)
    vmr.recorder.B2(ON)
    sleep(0.1)
    vmr.recorder.B2 = false
    sleep(0.1)
end
