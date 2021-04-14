require 'routines'

vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
    vmr.vban = ON
    sleep(3)

    vmr.vban_in[0].enable = true
    vmr.vban_in[0].enable = false

    vmr.vban_in[1].enable = true
    vmr.vban_in[1].enable = false

    vmr.vban_in[2].enable = true
    vmr.vban_in[2].enable = false


    vmr.vban_out[0].enable = true
    vmr.vban_out[0].enable = false

    vmr.vban_out[1].enable = true
    vmr.vban_out[1].enable = false

    vmr.vban_out[2].enable = true
    vmr.vban_out[2].enable = false

    sleep(4)
    vmr.vban = OFF
end
