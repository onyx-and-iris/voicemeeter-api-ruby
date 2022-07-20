require "voicemeeter"

class Observer
  def initialize(vm)
    @vm = vm
  end

  def update(subject)
    if subject == "pdirty"
      puts "pdirty!"
    elsif subject == "mdirty"
      puts "mdirty!"
    elsif subject == "ldirty"
      info = [
        "[#{@vm.bus[0].levels.isdirty?}]",
        "[#{@vm.bus[1].levels.isdirty?}]",
        "[#{@vm.bus[2].levels.isdirty?}]",
        "[#{@vm.bus[3].levels.isdirty?}]",
        "[#{@vm.bus[4].levels.isdirty?}]"
      ]
      puts info.join(" ")
    end
  end
end

kind_id = "banana"

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vm = Voicemeeter.remote(kind_id)

# vm.run accepts a block
vm.run do
  puts "press <Enter> to quit"
  obs = Observer.new(vm)
  vm.add_observer(obs)

  loop { exit if gets.chomp.empty? }
end
