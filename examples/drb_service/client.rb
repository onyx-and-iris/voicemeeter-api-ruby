require 'drb/drb'

# Change the hostname from ws.local to ip of drb server.
DRb.start_service
vmr_service = DRbObject.new_with_uri('druby://ws.local:3030')

# run any Voicemeeter commands supported by the wrapper.
(0...4).each do |i|
    if i != 5
        vmr_service.strip[i].A1 = !vmr_service.strip[i].A1
        vmr_service.strip[i].A3 = !vmr_service.strip[i].A3
        vmr_service.strip[i].mute = !vmr_service.strip[i].mute
        vmr_service.bus[i].eq = !vmr_service.bus[i].eq
    end
end

(0...4).each do |i|
    if i != 5
        vmr_service.strip[i].gain = -8.3
        vmr_service.strip[i].gain = -12.3
        vmr_service.strip[i].mono = !vmr_service.strip[i].mono
    end
end

DRb.stop_service
