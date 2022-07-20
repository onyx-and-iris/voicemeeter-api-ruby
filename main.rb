require "voicemeeter"

kind_id = "banana"

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vm = Voicemeeter.remote(kind_id)

# vm.run accepts a block
vm.run do
  vm.strip[0].label = "rode podmic"
  vm.strip[0].A2 = true
  puts "strip 0 (#{vm.strip[0].label}) A2 was set to #{vm.strip[0].A2}"

  vm.bus[1].eq = true
  puts "bus 1 eq was set to #{vm.bus[1].eq}"
end
