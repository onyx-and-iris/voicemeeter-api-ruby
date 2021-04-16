require 'routines'

vmr = Remote.new

vmr.run do
    vmr.vban = true
    sleep(3)

    vmr.vban_in[1].enable = true
    sleep(0.1)
    vmr.vban_in[1].enable = false

    vmr.vban_in[2].enable = true
    sleep(0.1)
    vmr.vban_in[2].enable = false

    vmr.vban_in[3].enable = true
    sleep(0.1)
    vmr.vban_in[3].enable = false


    vmr.vban_out[1].enable = true
    sleep(0.1)
    vmr.vban_out[1].enable = false

    vmr.vban_out[2].enable = true
    sleep(0.1)
    vmr.vban_out[2].enable = false

    vmr.vban_out[3].enable = true
    sleep(0.1)
    vmr.vban_out[3].enable = false

    (1..8).each do |num|
        vmr.vban_in[num].name = "test"
        sleep(0.1)
        vmr.vban_in[num].name = "Stream#{num}"
    end

    (1..8).each do |num|
        vmr.vban_out[num].name = "test"
        sleep(0.1)
        vmr.vban_out[num].name = "Stream#{num}"
    end


    sleep(5)
    vmr.vban = false
end
