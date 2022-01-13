require_relative '../minitest_helper'

class SetAndGetStrip < Minitest::Test
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

class SetAndGetBus < Minitest::Test
    def test_it_sets_and_gets_bus4_eq_true
        @@vmr.bus[4].eq = true
        assert_equal(true, @@vmr.bus[4].eq)
    end

    def test_it_sets_and_gets_bus4_eq_false
        @@vmr.bus[4].eq = false
        assert_equal(false, @@vmr.bus[4].eq)
    end
end