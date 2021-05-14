require_relative '../minitest_helper'

class SetAndGetParamsFloatWithAliasTrueFalse < Minitest::Test
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


class SetAndGetParamsFloatWithAliasOnOff < Minitest::Test
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
