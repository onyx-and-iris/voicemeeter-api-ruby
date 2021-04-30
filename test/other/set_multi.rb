require 'voicemeeter'

vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
    vmr.set_multi({
        :strip_1 => {"mute" => true, "gain" => 3.2, "A2" => true},
        :strip_2 => {"mute" => true, "gain" => -4.9, "A2" => true},
        :strip_3 => {"mute" => ON, "gain" => 6.7, "A2" => ON},
        :strip_4 => {"mute" => ON, "gain" => 8.1, "A2" => ON},
        :strip_5 => {"mute" => ON, "gain" => -4.2, "A2" => ON},
        :strip_6 => {"mute" => ON, "gain" => ON, "A2" => ON},
        :strip_7 => {"mute" => ON, "gain" => ON, "A2" => ON},
        :strip_8 => {"mute" => ON, "gain" => ON, "A2" => ON},
        :strip_9 => {"mute" => ON, "gain" => -2.8, "A2" => ON},
        :strip_10 => {"mute" => ON, "gain" => ON, "A2" => ON},
        :bus_1 => {"mute" => ON, "gain" => 4.8, "mono" => ON},
        :bus_2 => {"mute" => ON, "gain" => 7.6, "mono" => ON},
        :bus_3 => {"mute" => ON, "gain" => 3.2, "mono" => ON},
        :bus_4 => {"mute" => ON, "gain" => -5.2, "mono" => ON},
        :bus_5 => {"mute" => ON, "gain" => 10.0, "mono" => ON},
        :bus_6 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_12 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_15 => {"mute" => ON, "gain" => ON, "mono" => ON},

        :mb_1 => {"stateonly" => ON},
        :mb_2 => {"stateonly" => ON},
        :mb_3 => {"stateonly" => ON},

        :vban_in1 => {"enable" => ON},
        :vban_in2 => {"enable" => ON},
        :vban_in3 => {"enable" => ON},

        :vban_out1 => {"enable" => ON},
        :vban_out2 => {"enable" => ON},
        :vban_out3 => {"enable" => ON},
    })

    vmr.set_multi({
        :strip_1 => {"mute" => false, "gain" => OFF, "A2" => OFF},
        :strip_2 => {"mute" => false, "gain" => OFF, "A2" => OFF},
        :strip_3 => {"mute" => false, "gain" => OFF, "A2" => false},
        :strip_4 => {"mute" => false, "gain" => OFF, "A2" => false},
        :strip_5 => {"mute" => OFF, "gain" => OFF, "A2" => false},
        :strip_6 => {"mute" => OFF, "gain" => OFF, "A2" => false},
        :strip_7 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
        :strip_8 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
        :strip_9 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
        :strip_10 => {"mute" => OFF, "gain" => OFF, "A2" => OFF},
        :bus_1 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_2 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_3 => {"mute" => false, "gain" => OFF, "mono" => false},
        :bus_4 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_5 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_6 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_12 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :bus_15 => {"mute" => OFF, "gain" => OFF, "mono" => OFF},
        :mb_1 => {"stateonly" => OFF},
        :mb_2 => {"stateonly" => OFF},
        :mb_3 => {"stateonly" => OFF},

        :vban_in1 => {"enable" => OFF},
        :vban_in2 => {"enable" => OFF},
        :vban_in3 => {"enable" => OFF},

        :vban_out1 => {"enable" => OFF},
        :vban_out2 => {"enable" => OFF},
        :vban_out3 => {"enable" => OFF},
    })
end
