require 'routines'

vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
    30.times do
        vmr.set_multi({
            :strip_1 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_2 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_3 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_4 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_5 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_6 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_7 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_8 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_9 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :strip_10 => {"mute" => ON, "gain" => ON, "A2" => ON},
            :bus_1 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_2 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_3 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_4 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_5 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_6 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_12 => {"mute" => ON, "gain" => ON, "mono" => ON},
            :bus_15 => {"mute" => ON, "gain" => ON, "mono" => ON}
        })

        vmr.set_multi({
            :strip_1 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_2 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_3 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_4 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_5 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_6 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_7 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_8 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_9 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :strip_10 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
            :bus_1 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_2 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_3 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_4 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_5 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_6 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_12 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
            :bus_15 => {"mute" => OFF, "gain" => OFF, "mono" => OFF}
        })
    end
end