require 'drb/drb'
require 'voicemeeter'

kind_id = 'potato'

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vmr_service = Voicemeeter.remote(kind_id)
DRb.start_service('druby://ws.local:3030', vmr_service)
puts "Starting the Voicemeeter Remote API Distribute Ruby Service"

vmr_service.run do
  DRb.thread.join
rescue Interrupt
ensure
  DRb.stop_service
end
