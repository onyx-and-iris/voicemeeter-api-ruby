require 'voicemeeter'

vmr = Remote.new

vmr.run do
    vmr.command.load('test0.xml')
    vmr.command.load('test1.xml')
    vmr.command.load('test2.xml')
    vmr.command.save('save0.xml')
    vmr.command.save('save1.xml')
    vmr.command.save('save2.xml')
end
