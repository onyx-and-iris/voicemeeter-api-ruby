require 'voicemeeter'

vmr = Remote.new

vmr.run do
    vmr.vban = true
    puts 'Waiting 3 seconds after enable vban...'
    sleep(3)

    vmr.vban_out[1].bit = 16
    puts vmr.vban_out[1].bit

    vmr.vban_out[1].bit = 24
    puts vmr.vban_out[1].bit

    puts 'Waiting 5 seconds before disable vban...'
    sleep(5)
    vmr.vban = false
end
