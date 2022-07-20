require "drb/drb"

hostname = "ws.local"
port = 3030

# Change the hostname from ws.local to ip of drb server.
DRb.start_service
vm_service = DRbObject.new_with_uri("druby://#{hostname}:#{port}")

# run any Voicemeeter commands supported by the wrapper.

vm_service.strip[0].A1 = !vm_service.strip[0].A1
vm_service.strip[3].A3 = !vm_service.strip[3].A3
vm_service.strip[2].mute = !vm_service.strip[2].mute
vm_service.bus[0].eq = !vm_service.bus[0].eq
vm_service.strip[2].gain = -8.3
vm_service.strip[4].gain = -12.3
vm_service.strip[1].mono = !vm_service.strip[1].mono

DRb.stop_service
