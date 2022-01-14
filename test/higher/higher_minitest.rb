require_relative '../minitest_helper'

class SetAndGetStripBool < Minitest::Test
    def test_it_sets_and_gets_strip0_mute_on
        @@vmr.strip[0].mute = true
        assert_equal(true, @@vmr.strip[0].mute)
    end

    def test_it_sets_and_gets_strip0_mute_off
        @@vmr.strip[0].mute = false
        assert_equal(false, @@vmr.strip[0].mute)
    end

    def test_it_sets_and_gets_strip1_A1_true
        @@vmr.strip[1].A1 = true
        assert_equal(true, @@vmr.strip[1].A1)
    end

    def test_it_sets_and_gets_strip1_A1_false
        @@vmr.strip[1].A1 = false
        assert_equal(false, @@vmr.strip[1].A1)
    end
end

class SetAndGetStripFloat < Minitest::Test
    def test_it_sets_and_gets_strip2_gain_37
        @@vmr.strip[2].gain = 3.7
        assert_equal(3.7, @@vmr.strip[2].gain)
    end

    def test_it_sets_and_gets_strip2_gain_52
        @@vmr.strip[2].gain = -5.2
        assert_equal(-5.2, @@vmr.strip[2].gain)
    end
end

class SetAndGetBusBool < Minitest::Test
    def test_it_sets_and_gets_bus4_eq_true
        @@vmr.bus[4].eq = true
        assert_equal(true, @@vmr.bus[4].eq)
    end

    def test_it_sets_and_gets_bus4_eq_false
        @@vmr.bus[4].eq = false
        assert_equal(false, @@vmr.bus[4].eq)
    end
end

class SetAndGetVban < Minitest::Test
    def test_it_sets_and_gets_vban_instream0_on
        @@vmr.vban.instream[0].on = true
        assert_equal(true, @@vmr.vban.instream[0].on)
    end

    def test_it_sets_and_gets_vban_instream0_off
        @@vmr.vban.instream[0].on = false
        assert_equal(false, @@vmr.vban.instream[0].on)
    end
end

class SetAndGetRecorder < Minitest::Test
    def test_it_sets_and_gets_recorder_A2_on
        @@vmr.recorder.A2 = true
        assert_equal(true, @@vmr.recorder.A2)
    end

    def test_it_sets_and_gets_recorder_A2_off
        @@vmr.recorder.A2 = false
        assert_equal(false, @@vmr.recorder.A2)
    end

    def test_it_sets_and_gets_recorder_B1_on
        @@vmr.recorder.B1 = true
        assert_equal(true, @@vmr.recorder.B1)
    end

    def test_it_sets_and_gets_recorder_B1_off
        @@vmr.recorder.B1 = false
        assert_equal(false, @@vmr.recorder.B1)
    end
end
