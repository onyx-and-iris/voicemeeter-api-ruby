require 'voicemeeter'

vmr = Remote.new("banana")

OFF = 0
ON = 1

vmr.run do
    vmr.command.reset
end