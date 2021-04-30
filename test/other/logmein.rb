require 'voicemeeter'

vmr = Remote.new(logmein: true)

OFF = 0
ON = 1

def set_mute(vmr, num)
  vmr.strip[num].mute(ON)
  puts vmr.strip[num].mute
  vmr.strip[num].mute(OFF)
  puts vmr.strip[num].mute
end

set_mute(vmr, 1)

vmr.logout
