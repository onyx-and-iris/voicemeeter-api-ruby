require 'minitest/autorun'
require 'routines'

class MiniTest::Test
    OFF = 0
    ON = 1
    SUCCESS = 0
    ERROR = 1

    @@vmr = Remote.new("banana", logmein: true, base_0: true)

    @@param_hash = {
        :strip_0 => {
            "mute" => ON, "gain" => ON, "A1" => ON, "A2" => ON, "A3" => ON,
            "B1" => ON, "B2" => ON,
        },
        :strip_1 => {
            "mute" => ON, "gain" => ON, "A1" => ON, "A2" => ON, "A3" => ON,
            "B1" => ON, "B2" => ON,
        },
        :strip_2 => {
            "mute" => ON, "gain" => ON, "A1" => ON, "A2" => ON, "A3" => ON,
            "B1" => ON, "B2" => ON,
        },
        :strip_3 => {
            "mute" => ON, "gain" => ON, "A1" => ON, "A2" => ON, "A3" => ON,
            "B1" => ON, "B2" => ON,
        },
        :strip_4 => {
            "mute" => ON, "gain" => ON, "A1" => ON, "A2" => ON, "A3" => ON,
            "B1" => ON, "B2" => ON,
        },
        :bus_0 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_1 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_2 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_3 => {"mute" => ON, "gain" => ON, "mono" => ON},
        :bus_4 => {"mute" => ON, "gain" => ON, "mono" => ON},
    }

    def setup
    end

    def teardown
    end

    MiniTest.after_run do
        @@vmr.logout
    end
end
