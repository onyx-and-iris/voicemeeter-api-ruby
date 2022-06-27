require 'voicemeeter'

class Observer
    def update(subject)
        puts subject
    end
end

kind_id = 'potato'

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vm = Voicemeeter.remote(kind_id)

# vm.run accepts a block
vm.run do
    puts 'press q <Enter> to quit'
    obs = Observer.new
    vm.add_observer(obs)

    loop { exit if gets.chomp == 'q' }
end
