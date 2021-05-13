require 'voicemeeter'

vmr = Remote.new

vmr.run do
    vmr.vban = true
    puts 'Waiting 3 seconds after enable vban...'
    sleep(3)

    vmr.vban_in[1].port = 7000

    sleep(3)

    vmr.vban_out[3].quality = 4

    puts 'Waiting 5 seconds before disable vban...'
    sleep(5)
    vmr.vban = false
end
