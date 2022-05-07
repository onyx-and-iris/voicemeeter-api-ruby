require 'drb/drb'
require 'voicemeeter'

kind_id = 'potato'
hostname = 'ws.local'
port = 3030

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vmr_service = Voicemeeter.remote(kind_id)

# Change the hostname from ws.local to the ip the client needs to connect to.
DRb.start_service("druby://#{hostname}:#{port}", vmr_service)
puts 'Starting the Voicemeeter Remote API Distributed Ruby Service'

vmr_service.run do
    DRb.thread.join
rescue Interrupt
ensure
    DRb.stop_service
end
