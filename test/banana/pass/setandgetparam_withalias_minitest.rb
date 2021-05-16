require_relative '../minitest_helper'

class SetAndGetParamsBoolWithAliasTrueFalse < Minitest::Test
    def test_it_sets_and_gets_strip0_mute_on_with_alias
        @@vmr.strip[1].mute = true
        assert_equal(true, @@vmr.strip[1].mute)
    end

    def test_it_sets_and_gets_strip1_mute_on_with_alias
        @@vmr.strip[2].mute = true
        assert_equal(true, @@vmr.strip[2].mute)
    end

    def test_it_sets_and_gets_strip2_mute_on_with_alias
        @@vmr.strip[3].mute = true
        assert_equal(true, @@vmr.strip[3].mute)
    end

    def test_it_sets_and_gets_strip3_mute_on_with_alias
        @@vmr.strip[4].mute = true
        assert_equal(true, @@vmr.strip[4].mute)
    end

    def test_it_sets_and_gets_strip4_mute_on_with_alias
        @@vmr.strip[5].mute = true
        assert_equal(true, @@vmr.strip[5].mute)
    end

    def test_it_sets_and_gets_strip0_mute_off_with_alias
        @@vmr.strip[1].mute = false
        assert_equal(false, @@vmr.strip[1].mute)
    end

    def test_it_sets_and_gets_strip1_mute_off_with_alias
        @@vmr.strip[2].mute = false
        assert_equal(false, @@vmr.strip[2].mute)
    end

    def test_it_sets_and_gets_strip2_mute_off_with_alias
        @@vmr.strip[3].mute = false
        assert_equal(false, @@vmr.strip[3].mute)
    end

    def test_it_sets_and_gets_strip3_mute_off_with_alias
        @@vmr.strip[4].mute = false
        assert_equal(false, @@vmr.strip[4].mute)
    end

    def test_it_sets_and_gets_strip4_mute_off_with_alias
        @@vmr.strip[5].mute = false
        assert_equal(false, @@vmr.strip[5].mute)
    end

    def test_it_sets_and_gets_strip0_mono_on_with_alias
        @@vmr.strip[1].mono = true
        assert_equal(true, @@vmr.strip[1].mono)
    end

    def test_it_sets_and_gets_strip1_mono_on_with_alias
        @@vmr.strip[2].mono = true
        assert_equal(true, @@vmr.strip[2].mono)
    end

    def test_it_sets_and_gets_strip2_mono_on_with_alias
        @@vmr.strip[3].mono = true
        assert_equal(true, @@vmr.strip[3].mono)
    end

    def test_it_sets_and_gets_strip3_mc_on_with_alias
        @@vmr.strip[4].mc = true
        assert_equal(true, @@vmr.strip[4].mc)
    end

    def test_it_sets_and_gets_strip4_k_on_with_alias
        @@vmr.strip[5].k = true
        assert_equal(true, @@vmr.strip[5].k)
    end

    def test_it_sets_and_gets_strip0_mono_off_with_alias
        @@vmr.strip[1].mono = false
        assert_equal(false, @@vmr.strip[1].mono)
    end

    def test_it_sets_and_gets_strip1_mono_off_with_alias
        @@vmr.strip[2].mono = false
        assert_equal(false, @@vmr.strip[2].mono)
    end

    def test_it_sets_and_gets_strip2_mono_off_with_alias
        @@vmr.strip[3].mono = false
        assert_equal(false, @@vmr.strip[3].mono)
    end

    def test_it_sets_and_gets_strip3_mc_off_with_alias
        @@vmr.strip[4].mc = false
        assert_equal(false, @@vmr.strip[4].mc)
    end

    def test_it_sets_and_gets_strip4_k_off_with_alias
        @@vmr.strip[5].k = false
        assert_equal(false, @@vmr.strip[5].k)
    end

    def test_it_sets_and_gets_strip0_solo_on_with_alias
        @@vmr.strip[1].solo = true
        assert_equal(true, @@vmr.strip[1].solo)
    end

    def test_it_sets_and_gets_strip1_solo_on_with_alias
        @@vmr.strip[2].solo = true
        assert_equal(true, @@vmr.strip[2].solo)
    end

    def test_it_sets_and_gets_strip2_solo_on_with_alias
        @@vmr.strip[3].solo = true
        assert_equal(true, @@vmr.strip[3].solo)
    end

    def test_it_sets_and_gets_strip3_solo_on_with_alias
        @@vmr.strip[4].solo = true
        assert_equal(true, @@vmr.strip[4].solo)
    end

    def test_it_sets_and_gets_strip4_solo_on_with_alias
        @@vmr.strip[5].solo = true
        assert_equal(true, @@vmr.strip[5].solo)
    end

    def test_it_sets_and_gets_strip0_solo_off_with_alias
        @@vmr.strip[1].solo = false
        assert_equal(false, @@vmr.strip[1].solo)
    end

    def test_it_sets_and_gets_strip1_solo_off_with_alias
        @@vmr.strip[2].solo = false
        assert_equal(false, @@vmr.strip[2].solo)
    end

    def test_it_sets_and_gets_strip2_solo_off_with_alias
        @@vmr.strip[3].solo = false
        assert_equal(false, @@vmr.strip[3].solo)
    end

    def test_it_sets_and_gets_strip3_solo_off_with_alias
        @@vmr.strip[4].solo = false
        assert_equal(false, @@vmr.strip[4].solo)
    end

    def test_it_sets_and_gets_strip4_solo_off_with_alias
        @@vmr.strip[5].solo = false
        assert_equal(false, @@vmr.strip[5].solo)
    end

    def test_it_sets_and_gets_strip0_A1_on_with_alias
        @@vmr.strip[1].A1 = true
        assert_equal(true, @@vmr.strip[1].A1)
    end

    def test_it_sets_and_gets_strip1_A1_on_with_alias
        @@vmr.strip[2].A1 = true
        assert_equal(true, @@vmr.strip[2].A1)
    end

    def test_it_sets_and_gets_strip2_A1_on_with_alias
        @@vmr.strip[3].A1 = true
        assert_equal(true, @@vmr.strip[3].A1)
    end

    def test_it_sets_and_gets_strip3_A1_on_with_alias
        @@vmr.strip[4].A1 = true
        assert_equal(true, @@vmr.strip[4].A1)
    end

    def test_it_sets_and_gets_strip4_A1_on_with_alias
        @@vmr.strip[5].A1 = true
        assert_equal(true, @@vmr.strip[5].A1)
    end

    def test_it_sets_and_gets_strip0_A1_off_with_alias
        @@vmr.strip[1].A1 = false
        assert_equal(false, @@vmr.strip[1].A1)
    end

    def test_it_sets_and_gets_strip1_A1_off_with_alias
        @@vmr.strip[2].A1 = false
        assert_equal(false, @@vmr.strip[2].A1)
    end

    def test_it_sets_and_gets_strip2_A1_off_with_alias
        @@vmr.strip[3].A1 = false
        assert_equal(false, @@vmr.strip[3].A1)
    end

    def test_it_sets_and_gets_strip3_A1_off_with_alias
        @@vmr.strip[4].A1 = false
        assert_equal(false, @@vmr.strip[4].A1)
    end

    def test_it_sets_and_gets_strip4_A1_off_with_alias
        @@vmr.strip[5].A1 = false
        assert_equal(false, @@vmr.strip[5].A1)
    end

    def test_it_sets_and_gets_strip0_A2_on_with_alias
        @@vmr.strip[1].A2 = true
        assert_equal(true, @@vmr.strip[1].A2)
    end

    def test_it_sets_and_gets_strip1_A2_on_with_alias
        @@vmr.strip[2].A2 = true
        assert_equal(true, @@vmr.strip[2].A2)
    end

    def test_it_sets_and_gets_strip2_A2_on_with_alias
        @@vmr.strip[3].A2 = true
        assert_equal(true, @@vmr.strip[3].A2)
    end

    def test_it_sets_and_gets_strip3_A2_on_with_alias
        @@vmr.strip[4].A2 = true
        assert_equal(true, @@vmr.strip[4].A2)
    end

    def test_it_sets_and_gets_strip4_A2_on_with_alias
        @@vmr.strip[5].A2 = true
        assert_equal(true, @@vmr.strip[5].A2)
    end

    def test_it_sets_and_gets_strip0_A2_off_with_alias
        @@vmr.strip[1].A2 = false
        assert_equal(false, @@vmr.strip[1].A2)
    end

    def test_it_sets_and_gets_strip1_A2_off_with_alias
        @@vmr.strip[2].A2 = false
        assert_equal(false, @@vmr.strip[2].A2)
    end

    def test_it_sets_and_gets_strip2_A2_off_with_alias
        @@vmr.strip[3].A2 = false
        assert_equal(false, @@vmr.strip[3].A2)
    end

    def test_it_sets_and_gets_strip3_A2_off_with_alias
        @@vmr.strip[4].A2 = false
        assert_equal(false, @@vmr.strip[4].A2)
    end

    def test_it_sets_and_gets_strip4_A2_off_with_alias
        @@vmr.strip[5].A2 = false
        assert_equal(false, @@vmr.strip[5].A2)
    end

    def test_it_sets_and_gets_strip0_A3_on_with_alias
        @@vmr.strip[1].A3 = true
        assert_equal(true, @@vmr.strip[1].A3)
    end

    def test_it_sets_and_gets_strip1_A3_on_with_alias
        @@vmr.strip[2].A3 = true
        assert_equal(true, @@vmr.strip[2].A3)
    end

    def test_it_sets_and_gets_strip2_A3_on_with_alias
        @@vmr.strip[3].A3 = true
        assert_equal(true, @@vmr.strip[3].A3)
    end

    def test_it_sets_and_gets_strip3_A3_on_with_alias
        @@vmr.strip[4].A3 = true
        assert_equal(true, @@vmr.strip[4].A3)
    end

    def test_it_sets_and_gets_strip4_A3_on_with_alias
        @@vmr.strip[5].A3 = true
        assert_equal(true, @@vmr.strip[5].A3)
    end

    def test_it_sets_and_gets_strip0_A3_off_with_alias
        @@vmr.strip[1].A3 = false
        assert_equal(false, @@vmr.strip[1].A3)
    end

    def test_it_sets_and_gets_strip1_A3_off_with_alias
        @@vmr.strip[2].A3 = false
        assert_equal(false, @@vmr.strip[2].A3)
    end

    def test_it_sets_and_gets_strip2_A3_off_with_alias
        @@vmr.strip[3].A3 = false
        assert_equal(false, @@vmr.strip[3].A3)
    end

    def test_it_sets_and_gets_strip3_A3_off_with_alias
        @@vmr.strip[4].A3 = false
        assert_equal(false, @@vmr.strip[4].A3)
    end

    def test_it_sets_and_gets_strip4_A3_off_with_alias
        @@vmr.strip[5].A3 = false
        assert_equal(false, @@vmr.strip[5].A3)
    end

    def test_it_sets_and_gets_strip0_B1_on_with_alias
        @@vmr.strip[1].B1 = true
        assert_equal(true, @@vmr.strip[1].B1)
    end

    def test_it_sets_and_gets_strip1_B1_on_with_alias
        @@vmr.strip[2].B1 = true
        assert_equal(true, @@vmr.strip[2].B1)
    end

    def test_it_sets_and_gets_strip2_B1_on_with_alias
        @@vmr.strip[3].B1 = true
        assert_equal(true, @@vmr.strip[3].B1)
    end

    def test_it_sets_and_gets_strip3_B1_on_with_alias
        @@vmr.strip[4].B1 = true
        assert_equal(true, @@vmr.strip[4].B1)
    end

    def test_it_sets_and_gets_strip4_B1_on_with_alias
        @@vmr.strip[5].B1 = true
        assert_equal(true, @@vmr.strip[5].B1)
    end

    def test_it_sets_and_gets_strip0_B1_off_with_alias
        @@vmr.strip[1].B1 = false
        assert_equal(false, @@vmr.strip[1].B1)
    end

    def test_it_sets_and_gets_strip1_B1_off_with_alias
        @@vmr.strip[2].B1 = false
        assert_equal(false, @@vmr.strip[2].B1)
    end

    def test_it_sets_and_gets_strip2_B1_off_with_alias
        @@vmr.strip[3].B1 = false
        assert_equal(false, @@vmr.strip[3].B1)
    end

    def test_it_sets_and_gets_strip3_B1_off_with_alias
        @@vmr.strip[4].B1 = false
        assert_equal(false, @@vmr.strip[4].B1)
    end

    def test_it_sets_and_gets_strip4_B1_off_with_alias
        @@vmr.strip[5].B1 = false
        assert_equal(false, @@vmr.strip[5].B1)
    end

    def test_it_sets_and_gets_strip0_B2_on_with_alias
        @@vmr.strip[1].B2 = true
        assert_equal(true, @@vmr.strip[1].B2)
    end

    def test_it_sets_and_gets_strip1_B2_on_with_alias
        @@vmr.strip[2].B2 = true
        assert_equal(true, @@vmr.strip[2].B2)
    end

    def test_it_sets_and_gets_strip2_B2_on_with_alias
        @@vmr.strip[3].B2 = true
        assert_equal(true, @@vmr.strip[3].B2)
    end

    def test_it_sets_and_gets_strip3_B2_on_with_alias
        @@vmr.strip[4].B2 = true
        assert_equal(true, @@vmr.strip[4].B2)
    end

    def test_it_sets_and_gets_strip4_B2_on_with_alias
        @@vmr.strip[5].B2 = true
        assert_equal(true, @@vmr.strip[5].B2)
    end

    def test_it_sets_and_gets_strip0_B2_off_with_alias
        @@vmr.strip[1].B2 = false
        assert_equal(false, @@vmr.strip[1].B2)
    end

    def test_it_sets_and_gets_strip1_B2_off_with_alias
        @@vmr.strip[2].B2 = false
        assert_equal(false, @@vmr.strip[2].B2)
    end

    def test_it_sets_and_gets_strip2_B2_off_with_alias
        @@vmr.strip[3].B2 = false
        assert_equal(false, @@vmr.strip[3].B2)
    end

    def test_it_sets_and_gets_strip3_B2_off_with_alias
        @@vmr.strip[4].B2 = false
        assert_equal(false, @@vmr.strip[4].B2)
    end

    def test_it_sets_and_gets_strip4_B2_off_with_alias
        @@vmr.strip[5].B2 = false
        assert_equal(false, @@vmr.strip[5].B2)
    end

    def test_it_sets_and_gets_strip0_gain_on_with_alias
        @@vmr.strip[1].gain = 1.0
        assert_equal(1.0, @@vmr.strip[1].gain)
    end

    def test_it_sets_and_gets_strip0_gain_off_with_alias
        @@vmr.strip[1].gain = 0.0
        assert_equal(0.0, @@vmr.strip[1].gain)
    end

    def test_it_sets_and_gets_strip0_limit_on_with_alias
        @@vmr.strip[1].limit = 1.0
        assert_equal(1.0, @@vmr.strip[1].limit)
    end

    def test_it_sets_and_gets_strip0_limit_off_with_alias
        @@vmr.strip[1].limit = 0.0
        assert_equal(0.0, @@vmr.strip[1].limit)
    end

    def test_it_sets_and_gets_strip0_limit_on_with_alias
        @@vmr.strip[1].limit = 1.0
        assert_equal(1.0, @@vmr.strip[1].limit)
    end

    def test_it_sets_and_gets_strip0_limit_off_with_alias
        @@vmr.strip[1].limit = 0.0
        assert_equal(0.0, @@vmr.strip[1].limit)
    end
end


class SetAndGetParamsBoolWithAliasOnOff < Minitest::Test
    def test_it_sets_and_gets_strip0_mute_on_with_alias
        @@vmr.strip[1].mute(ON)
        assert_equal(true, @@vmr.strip[1].mute)
    end

    def test_it_sets_and_gets_strip1_mute_on_with_alias
        @@vmr.strip[2].mute(ON)
        assert_equal(true, @@vmr.strip[2].mute)
    end

    def test_it_sets_and_gets_strip2_mute_on_with_alias
        @@vmr.strip[3].mute(ON)
        assert_equal(true, @@vmr.strip[3].mute)
    end

    def test_it_sets_and_gets_strip3_mute_on_with_alias
        @@vmr.strip[4].mute(ON)
        assert_equal(true, @@vmr.strip[4].mute)
    end

    def test_it_sets_and_gets_strip4_mute_on_with_alias
        @@vmr.strip[5].mute(ON)
        assert_equal(true, @@vmr.strip[5].mute)
    end

    def test_it_sets_and_gets_strip0_mute_off_with_alias
        @@vmr.strip[1].mute(OFF)
        assert_equal(false, @@vmr.strip[1].mute)
    end

    def test_it_sets_and_gets_strip1_mute_off_with_alias
        @@vmr.strip[2].mute(OFF)
        assert_equal(false, @@vmr.strip[2].mute)
    end

    def test_it_sets_and_gets_strip2_mute_off_with_alias
        @@vmr.strip[3].mute(OFF)
        assert_equal(false, @@vmr.strip[3].mute)
    end

    def test_it_sets_and_gets_strip3_mute_off_with_alias
        @@vmr.strip[4].mute(OFF)
        assert_equal(false, @@vmr.strip[4].mute)
    end

    def test_it_sets_and_gets_strip4_mute_off_with_alias
        @@vmr.strip[5].mute(OFF)
        assert_equal(false, @@vmr.strip[5].mute)
    end

    def test_it_sets_and_gets_strip0_mono_on_with_alias
        @@vmr.strip[1].mono(ON)
        assert_equal(true, @@vmr.strip[1].mono)
    end

    def test_it_sets_and_gets_strip1_mono_on_with_alias
        @@vmr.strip[2].mono(ON)
        assert_equal(true, @@vmr.strip[2].mono)
    end

    def test_it_sets_and_gets_strip2_mono_on_with_alias
        @@vmr.strip[3].mono(ON)
        assert_equal(true, @@vmr.strip[3].mono)
    end

    def test_it_sets_and_gets_strip3_mc_on_with_alias
        @@vmr.strip[4].mc(ON)
        assert_equal(true, @@vmr.strip[4].mc)
    end

    def test_it_sets_and_gets_strip4_k_on_with_alias
        @@vmr.strip[5].k(ON)
        assert_equal(true, @@vmr.strip[5].k)
    end

    def test_it_sets_and_gets_strip0_mono_off_with_alias
        @@vmr.strip[1].mono(OFF)
        assert_equal(false, @@vmr.strip[1].mono)
    end

    def test_it_sets_and_gets_strip1_mono_off_with_alias
        @@vmr.strip[2].mono(OFF)
        assert_equal(false, @@vmr.strip[2].mono)
    end

    def test_it_sets_and_gets_strip2_mono_off_with_alias
        @@vmr.strip[3].mono(OFF)
        assert_equal(false, @@vmr.strip[3].mono)
    end

    def test_it_sets_and_gets_strip3_mc_off_with_alias
        @@vmr.strip[4].mc(OFF)
        assert_equal(false, @@vmr.strip[4].mc)
    end

    def test_it_sets_and_gets_strip4_k_off_with_alias
        @@vmr.strip[5].k(OFF)
        assert_equal(false, @@vmr.strip[5].k)
    end

    def test_it_sets_and_gets_strip0_solo_on_with_alias
        @@vmr.strip[1].solo(ON)
        assert_equal(true, @@vmr.strip[1].solo)
    end

    def test_it_sets_and_gets_strip1_solo_on_with_alias
        @@vmr.strip[2].solo(ON)
        assert_equal(true, @@vmr.strip[2].solo)
    end

    def test_it_sets_and_gets_strip2_solo_on_with_alias
        @@vmr.strip[3].solo(ON)
        assert_equal(true, @@vmr.strip[3].solo)
    end

    def test_it_sets_and_gets_strip3_solo_on_with_alias
        @@vmr.strip[4].solo(ON)
        assert_equal(true, @@vmr.strip[4].solo)
    end

    def test_it_sets_and_gets_strip4_solo_on_with_alias
        @@vmr.strip[5].solo(ON)
        assert_equal(true, @@vmr.strip[5].solo)
    end

    def test_it_sets_and_gets_strip0_solo_off_with_alias
        @@vmr.strip[1].solo(OFF)
        assert_equal(false, @@vmr.strip[1].solo)
    end

    def test_it_sets_and_gets_strip1_solo_off_with_alias
        @@vmr.strip[2].solo(OFF)
        assert_equal(false, @@vmr.strip[2].solo)
    end

    def test_it_sets_and_gets_strip2_solo_off_with_alias
        @@vmr.strip[3].solo(OFF)
        assert_equal(false, @@vmr.strip[3].solo)
    end

    def test_it_sets_and_gets_strip3_solo_off_with_alias
        @@vmr.strip[4].solo(OFF)
        assert_equal(false, @@vmr.strip[4].solo)
    end

    def test_it_sets_and_gets_strip4_solo_off_with_alias
        @@vmr.strip[5].solo(OFF)
        assert_equal(false, @@vmr.strip[5].solo)
    end

    def test_it_sets_and_gets_strip0_A1_on_with_alias
        @@vmr.strip[1].A1(ON)
        assert_equal(true, @@vmr.strip[1].A1)
    end

    def test_it_sets_and_gets_strip1_A1_on_with_alias
        @@vmr.strip[2].A1(ON)
        assert_equal(true, @@vmr.strip[2].A1)
    end

    def test_it_sets_and_gets_strip2_A1_on_with_alias
        @@vmr.strip[3].A1(ON)
        assert_equal(true, @@vmr.strip[3].A1)
    end

    def test_it_sets_and_gets_strip3_A1_on_with_alias
        @@vmr.strip[4].A1(ON)
        assert_equal(true, @@vmr.strip[4].A1)
    end

    def test_it_sets_and_gets_strip4_A1_on_with_alias
        @@vmr.strip[5].A1(ON)
        assert_equal(true, @@vmr.strip[5].A1)
    end

    def test_it_sets_and_gets_strip0_A1_off_with_alias
        @@vmr.strip[1].A1(OFF)
        assert_equal(false, @@vmr.strip[1].A1)
    end

    def test_it_sets_and_gets_strip1_A1_off_with_alias
        @@vmr.strip[2].A1(OFF)
        assert_equal(false, @@vmr.strip[2].A1)
    end

    def test_it_sets_and_gets_strip2_A1_off_with_alias
        @@vmr.strip[3].A1(OFF)
        assert_equal(false, @@vmr.strip[3].A1)
    end

    def test_it_sets_and_gets_strip3_A1_off_with_alias
        @@vmr.strip[4].A1(OFF)
        assert_equal(false, @@vmr.strip[4].A1)
    end

    def test_it_sets_and_gets_strip4_A1_off_with_alias
        @@vmr.strip[5].A1(OFF)
        assert_equal(false, @@vmr.strip[5].A1)
    end

    def test_it_sets_and_gets_strip0_B1_on_with_alias
        @@vmr.strip[1].B1(ON)
        assert_equal(true, @@vmr.strip[1].B1)
    end

    def test_it_sets_and_gets_strip1_B1_on_with_alias
        @@vmr.strip[2].B1(ON)
        assert_equal(true, @@vmr.strip[2].B1)
    end

    def test_it_sets_and_gets_strip2_B1_on_with_alias
        @@vmr.strip[3].B1(ON)
        assert_equal(true, @@vmr.strip[3].B1)
    end

    def test_it_sets_and_gets_strip3_B1_on_with_alias
        @@vmr.strip[4].B1(ON)
        assert_equal(true, @@vmr.strip[4].B1)
    end

    def test_it_sets_and_gets_strip4_B1_on_with_alias
        @@vmr.strip[5].B1(ON)
        assert_equal(true, @@vmr.strip[5].B1)
    end

    def test_it_sets_and_gets_strip0_B1_off_with_alias
        @@vmr.strip[1].B1(OFF)
        assert_equal(false, @@vmr.strip[1].B1)
    end

    def test_it_sets_and_gets_strip1_B1_off_with_alias
        @@vmr.strip[2].B1(OFF)
        assert_equal(false, @@vmr.strip[2].B1)
    end

    def test_it_sets_and_gets_strip2_B1_off_with_alias
        @@vmr.strip[3].B1(OFF)
        assert_equal(false, @@vmr.strip[3].B1)
    end

    def test_it_sets_and_gets_strip3_B1_off_with_alias
        @@vmr.strip[4].B1(OFF)
        assert_equal(false, @@vmr.strip[4].B1)
    end

    def test_it_sets_and_gets_strip4_B1_off_with_alias
        @@vmr.strip[5].B1(OFF)
        assert_equal(false, @@vmr.strip[5].B1)
    end

    def test_it_sets_and_gets_bus0_EQ_on_with_alias
        @@vmr.bus[1].eq(ON)
        assert_equal(true, @@vmr.bus[1].eq)
    end

    def test_it_sets_and_gets_bus0_EQ_off_with_alias
        @@vmr.bus[1].eq(OFF)
        assert_equal(false, @@vmr.bus[1].eq)
    end

    def test_it_sets_and_gets_bus1_EQ_on_with_alias
        @@vmr.bus[2].eq(ON)
        assert_equal(true, @@vmr.bus[2].eq)
    end

    def test_it_sets_and_gets_bus1_EQ_off_with_alias
        @@vmr.bus[2].eq(OFF)
        assert_equal(false, @@vmr.bus[2].eq)
    end

    def test_it_sets_and_gets_bus2_EQ_on_with_alias
        @@vmr.bus[3].eq(ON)
        assert_equal(true, @@vmr.bus[3].eq)
    end

    def test_it_sets_and_gets_bus2_EQ_off_with_alias
        @@vmr.bus[3].eq(OFF)
        assert_equal(false, @@vmr.bus[3].eq)
    end

    def test_it_sets_and_gets_bus3_EQ_on_with_alias
        @@vmr.bus[4].eq(ON)
        assert_equal(true, @@vmr.bus[4].eq)
    end

    def test_it_sets_and_gets_bus3_EQ_off_with_alias
        @@vmr.bus[4].eq(OFF)
        assert_equal(false, @@vmr.bus[4].eq)
    end

    def test_it_sets_and_gets_bus4_EQ_on_with_alias
        @@vmr.bus[5].eq(ON)
        assert_equal(true, @@vmr.bus[5].eq)
    end

    def test_it_sets_and_gets_bus4_EQ_off_with_alias
        @@vmr.bus[5].eq(OFF)
        assert_equal(false, @@vmr.bus[5].eq)
    end
end


class SetAndGetParamsFloatWithAlias < Minitest::Test
    def test_it_sets_and_gets_strip0_gain_42_with_alias
        @@vmr.strip[1].gain = 4.2
        assert_equal(4.2, @@vmr.strip[1].gain)
    end

    def test_it_sets_and_gets_strip0_gain_75_with_alias
        @@vmr.strip[1].gain = -7.5
        assert_equal(-7.5, @@vmr.strip[1].gain)
    end

    def test_it_sets_and_gets_strip1_gain_27_with_alias
        @@vmr.strip[2].gain = -2.7
        assert_equal(-2.7, @@vmr.strip[2].gain)
    end

    def test_it_sets_and_gets_strip1_gain_43_with_alias
        @@vmr.strip[2].gain = 4.3
        assert_equal(4.3, @@vmr.strip[2].gain)
    end

    def test_it_sets_and_gets_strip2_gain_18_with_alias
        @@vmr.strip[3].gain = 1.8
        assert_equal(1.8, @@vmr.strip[3].gain)
    end

    def test_it_sets_and_gets_strip2_gain_108_with_alias
        @@vmr.strip[3].gain = -10.8
        assert_equal(-10.8, @@vmr.strip[3].gain)
    end

    def test_it_sets_and_gets_bus0_gain_42_with_alias
        @@vmr.bus[1].gain = 4.2
        assert_equal(4.2, @@vmr.bus[1].gain)
    end

    def test_it_sets_and_gets_bus0_gain_75_with_alias
        @@vmr.bus[1].gain = -7.5
        assert_equal(-7.5, @@vmr.bus[1].gain)
    end

    def test_it_sets_and_gets_bus1_gain_27_with_alias
        @@vmr.bus[2].gain = -2.7
        assert_equal(-2.7, @@vmr.bus[2].gain)
    end

    def test_it_sets_and_gets_bus1_gain_43_with_alias
        @@vmr.bus[2].gain = 4.3
        assert_equal(4.3, @@vmr.bus[2].gain)
    end

    def test_it_sets_and_gets_strip0_comp_42_with_alias
        @@vmr.strip[1].comp = 4.2
        assert_equal(4.2, @@vmr.strip[1].comp)
    end

    def test_it_sets_and_gets_strip0_comp_75_with_alias
        @@vmr.strip[1].comp = 7.5
        assert_equal(7.5, @@vmr.strip[1].comp)
    end

    def test_it_sets_and_gets_strip1_comp_27_with_alias
        @@vmr.strip[2].comp = 2.7
        assert_equal(2.7, @@vmr.strip[2].comp)
    end

    def test_it_sets_and_gets_strip1_comp_43_with_alias
        @@vmr.strip[2].comp = 4.3
        assert_equal(4.3, @@vmr.strip[2].comp)
    end

    def test_it_sets_and_gets_strip2_comp_18_with_alias
        @@vmr.strip[3].comp = 1.8
        assert_equal(1.8, @@vmr.strip[3].comp)
    end

    def test_it_sets_and_gets_strip2_comp_10_with_alias
        @@vmr.strip[3].comp = 10
        assert_equal(10, @@vmr.strip[3].comp)
    end

    def test_it_sets_and_gets_strip0_gate_42_with_alias
        @@vmr.strip[1].gate = 4.2
        assert_equal(4.2, @@vmr.strip[1].gate)
    end

    def test_it_sets_and_gets_strip0_gate_75_with_alias
        @@vmr.strip[1].gate = 7.5
        assert_equal(7.5, @@vmr.strip[1].gate)
    end

    def test_it_sets_and_gets_strip1_gate_27_with_alias
        @@vmr.strip[2].gate = 2.7
        assert_equal(2.7, @@vmr.strip[2].gate)
    end

    def test_it_sets_and_gets_strip1_gate_43_with_alias
        @@vmr.strip[2].gate = 4.3
        assert_equal(4.3, @@vmr.strip[2].gate)
    end

    def test_it_sets_and_gets_strip2_gate_18_with_alias
        @@vmr.strip[3].gate = 1.8
        assert_equal(1.8, @@vmr.strip[3].gate)
    end

    def test_it_sets_and_gets_strip2_gate_10_with_alias
        @@vmr.strip[3].gate = 10
        assert_equal(10, @@vmr.strip[3].gate)
    end
end


class SetAndGetParamsIntWithAlias < Minitest::Test
    def test_it_sets_and_gets_strip0_limit_4_with_alias
        @@vmr.strip[1].limit = -4
        assert_equal(-4, @@vmr.strip[1].limit)
    end

    def test_it_sets_and_gets_strip0_limit_7_with_alias
        @@vmr.strip[1].limit = -7
        assert_equal(-7, @@vmr.strip[1].limit)
    end

    def test_it_sets_and_gets_strip1_limit_2_with_alias
        @@vmr.strip[2].limit = -2
        assert_equal(-2, @@vmr.strip[2].limit)
    end

    def test_it_sets_and_gets_strip1_limit_8_with_alias
        @@vmr.strip[2].limit = -8
        assert_equal(-8, @@vmr.strip[2].limit)
    end

    def test_it_sets_and_gets_strip2_limit_1_with_alias
        @@vmr.strip[3].limit = 1
        assert_equal(1, @@vmr.strip[3].limit)
    end

    def test_it_sets_and_gets_strip2_limit_10_with_alias
        @@vmr.strip[3].limit = -10
        assert_equal(-10, @@vmr.strip[3].limit)
    end
end


class SetAndGetParamsStringWithAlias < Minitest::Test
    def test_it_sets_and_gets_strip0_label_test0_with_alias
        @@vmr.strip[1].label = 'test0'
        assert_equal('test0', @@vmr.strip[1].label)
    end

    def test_it_sets_and_gets_strip0_label_test1_with_alias
        @@vmr.strip[1].label = 'test1'
        assert_equal('test1', @@vmr.strip[1].label)
    end

    def test_it_sets_and_gets_strip1_label_test0_with_alias
        @@vmr.strip[2].label = 'test0'
        assert_equal('test0', @@vmr.strip[2].label)
    end

    def test_it_sets_and_gets_strip1_label_test1_with_alias
        @@vmr.strip[2].label = 'test1'
        assert_equal('test1', @@vmr.strip[2].label)
    end

    def test_it_sets_and_gets_strip2_label_test0_with_alias
        @@vmr.strip[3].label = 'test0'
        assert_equal('test0', @@vmr.strip[3].label)
    end

    def test_it_sets_and_gets_strip2_label_test1_with_alias
        @@vmr.strip[3].label = 'test1'
        assert_equal('test1', @@vmr.strip[3].label)
    end
end
