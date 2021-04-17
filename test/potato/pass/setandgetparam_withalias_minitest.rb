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

    def test_it_sets_and_gets_strip5_mute_on_with_alias
        @@vmr.strip[6].mute = true
        assert_equal(true, @@vmr.strip[6].mute)
    end

    def test_it_sets_and_gets_strip6_mute_on_with_alias
        @@vmr.strip[7].mute = true
        assert_equal(true, @@vmr.strip[7].mute)
    end

    def test_it_sets_and_gets_strip7_mute_on_with_alias
        @@vmr.strip[8].mute = true
        assert_equal(true, @@vmr.strip[8].mute)
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

    def test_it_sets_and_gets_strip5_mute_off_with_alias
        @@vmr.strip[6].mute = false
        assert_equal(false, @@vmr.strip[6].mute)
    end

    def test_it_sets_and_gets_strip6_mute_off_with_alias
        @@vmr.strip[7].mute = false
        assert_equal(false, @@vmr.strip[7].mute)
    end

    def test_it_sets_and_gets_strip7_mute_off_with_alias
        @@vmr.strip[8].mute = false
        assert_equal(false, @@vmr.strip[8].mute)
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

    def test_it_sets_and_gets_strip3_mono_on_with_alias
        @@vmr.strip[4].mono = true
        assert_equal(true, @@vmr.strip[4].mono)
    end

    def test_it_sets_and_gets_strip4_mono_on_with_alias
        @@vmr.strip[5].mono = true
        assert_equal(true, @@vmr.strip[5].mono)
    end

    def test_it_sets_and_gets_strip5_mc_on_with_alias
        @@vmr.strip[6].mc = true
        assert_equal(true, @@vmr.strip[6].mc)
    end

    def test_it_sets_and_gets_strip6_k_on_with_alias
        @@vmr.strip[7].k = true
        assert_equal(true, @@vmr.strip[7].k)
    end

    def test_it_sets_and_gets_strip7_mc_on_with_alias
        @@vmr.strip[8].mc = true
        assert_equal(true, @@vmr.strip[8].mc)
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

    def test_it_sets_and_gets_strip3_mono_off_with_alias
        @@vmr.strip[4].mono = false
        assert_equal(false, @@vmr.strip[4].mono)
    end

    def test_it_sets_and_gets_strip4_mono_off_with_alias
        @@vmr.strip[5].mono = false
        assert_equal(false, @@vmr.strip[5].mono)
    end

    def test_it_sets_and_gets_strip5_mc_off_with_alias
        @@vmr.strip[6].mc = false
        assert_equal(false, @@vmr.strip[6].mc)
    end

    def test_it_sets_and_gets_strip6_k_off_with_alias
        @@vmr.strip[7].k = false
        assert_equal(false, @@vmr.strip[7].k)
    end

    def test_it_sets_and_gets_strip7_mc_off_with_alias
        @@vmr.strip[8].mc = false
        assert_equal(false, @@vmr.strip[8].mc)
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

    def test_it_sets_and_gets_strip5_solo_on_with_alias
        @@vmr.strip[6].solo = true
        assert_equal(true, @@vmr.strip[6].solo)
    end

    def test_it_sets_and_gets_strip6_solo_on_with_alias
        @@vmr.strip[7].solo = true
        assert_equal(true, @@vmr.strip[7].solo)
    end

    def test_it_sets_and_gets_strip7_solo_on_with_alias
        @@vmr.strip[8].solo = true
        assert_equal(true, @@vmr.strip[8].solo)
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

    def test_it_sets_and_gets_strip5_solo_off_with_alias
        @@vmr.strip[6].solo = false
        assert_equal(false, @@vmr.strip[6].solo)
    end

    def test_it_sets_and_gets_strip6_solo_off_with_alias
        @@vmr.strip[7].solo = false
        assert_equal(false, @@vmr.strip[7].solo)
    end

    def test_it_sets_and_gets_strip7_solo_off_with_alias
        @@vmr.strip[8].solo = false
        assert_equal(false, @@vmr.strip[8].solo)
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

    def test_it_sets_and_gets_strip5_A1_on_with_alias
        @@vmr.strip[6].A1 = true
        assert_equal(true, @@vmr.strip[6].A1)
    end

    def test_it_sets_and_gets_strip6_A1_on_with_alias
        @@vmr.strip[7].A1 = true
        assert_equal(true, @@vmr.strip[7].A1)
    end

    def test_it_sets_and_gets_strip7_A1_on_with_alias
        @@vmr.strip[8].A1 = true
        assert_equal(true, @@vmr.strip[8].A1)
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

    def test_it_sets_and_gets_strip5_A1_off_with_alias
        @@vmr.strip[6].A1 = false
        assert_equal(false, @@vmr.strip[6].A1)
    end

    def test_it_sets_and_gets_strip6_A1_off_with_alias
        @@vmr.strip[7].A1 = false
        assert_equal(false, @@vmr.strip[7].A1)
    end

    def test_it_sets_and_gets_strip7_A1_off_with_alias
        @@vmr.strip[8].A1 = false
        assert_equal(false, @@vmr.strip[8].A1)
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

    def test_it_sets_and_gets_strip5_A2_on_with_alias
        @@vmr.strip[5].A2 = true
        assert_equal(true, @@vmr.strip[5].A2)
    end

    def test_it_sets_and_gets_strip6_A2_on_with_alias
        @@vmr.strip[6].A2 = true
        assert_equal(true, @@vmr.strip[6].A2)
    end

    def test_it_sets_and_gets_strip7_A2_on_with_alias
        @@vmr.strip[7].A2 = true
        assert_equal(true, @@vmr.strip[7].A2)
    end

    def test_it_sets_and_gets_strip8_A2_on_with_alias
        @@vmr.strip[8].A2 = true
        assert_equal(true, @@vmr.strip[8].A2)
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

    def test_it_sets_and_gets_strip5_A2_off_with_alias
        @@vmr.strip[6].A2 = false
        assert_equal(false, @@vmr.strip[6].A2)
    end

    def test_it_sets_and_gets_strip6_A2_off_with_alias
        @@vmr.strip[7].A2 = false
        assert_equal(false, @@vmr.strip[7].A2)
    end

    def test_it_sets_and_gets_strip7_A2_off_with_alias
        @@vmr.strip[8].A2 = false
        assert_equal(false, @@vmr.strip[8].A2)
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

    def test_it_sets_and_gets_strip5_A3_on_with_alias
        @@vmr.strip[6].A3 = true
        assert_equal(true, @@vmr.strip[6].A3)
    end

    def test_it_sets_and_gets_strip6_A3_on_with_alias
        @@vmr.strip[7].A3 = true
        assert_equal(true, @@vmr.strip[7].A3)
    end

    def test_it_sets_and_gets_strip7_A3_on_with_alias
        @@vmr.strip[8].A3 = true
        assert_equal(true, @@vmr.strip[8].A3)
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

    def test_it_sets_and_gets_strip5_A3_off_with_alias
        @@vmr.strip[6].A3 = false
        assert_equal(false, @@vmr.strip[6].A3)
    end

    def test_it_sets_and_gets_strip6_A3_off_with_alias
        @@vmr.strip[7].A3 = false
        assert_equal(false, @@vmr.strip[7].A3)
    end

    def test_it_sets_and_gets_strip7_A3_off_with_alias
        @@vmr.strip[8].A3 = false
        assert_equal(false, @@vmr.strip[8].A3)
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

    def test_it_sets_and_gets_strip5_B1_on_with_alias
        @@vmr.strip[6].B1 = true
        assert_equal(true, @@vmr.strip[6].B1)
    end

    def test_it_sets_and_gets_strip6_B1_on_with_alias
        @@vmr.strip[7].B1 = true
        assert_equal(true, @@vmr.strip[7].B1)
    end

    def test_it_sets_and_gets_strip7_B1_on_with_alias
        @@vmr.strip[8].B1 = true
        assert_equal(true, @@vmr.strip[8].B1)
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

    def test_it_sets_and_gets_strip5_B1_off_with_alias
        @@vmr.strip[6].B1 = false
        assert_equal(false, @@vmr.strip[6].B1)
    end

    def test_it_sets_and_gets_strip6_B1_off_with_alias
        @@vmr.strip[7].B1 = false
        assert_equal(false, @@vmr.strip[7].B1)
    end

    def test_it_sets_and_gets_strip7_B1_off_with_alias
        @@vmr.strip[8].B1 = false
        assert_equal(false, @@vmr.strip[8].B1)
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

    def test_it_sets_and_gets_strip5_B2_on_with_alias
        @@vmr.strip[6].B2 = true
        assert_equal(true, @@vmr.strip[6].B2)
    end

    def test_it_sets_and_gets_strip6_B2_on_with_alias
        @@vmr.strip[7].B2 = true
        assert_equal(true, @@vmr.strip[7].B2)
    end

    def test_it_sets_and_gets_strip7_B2_on_with_alias
        @@vmr.strip[8].B2 = true
        assert_equal(true, @@vmr.strip[8].B2)
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

    def test_it_sets_and_gets_strip5_B2_off_with_alias
        @@vmr.strip[6].B2 = false
        assert_equal(false, @@vmr.strip[6].B2)
    end

    def test_it_sets_and_gets_strip6_B2_off_with_alias
        @@vmr.strip[7].B2 = false
        assert_equal(false, @@vmr.strip[7].B2)
    end

    def test_it_sets_and_gets_strip7_B2_off_with_alias
        @@vmr.strip[8].B2 = false
        assert_equal(false, @@vmr.strip[8].B2)
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

    def test_it_sets_and_gets_strip5_mute_on_with_alias
        @@vmr.strip[6].mute(ON)
        assert_equal(true, @@vmr.strip[6].mute)
    end

    def test_it_sets_and_gets_strip6_mute_on_with_alias
        @@vmr.strip[7].mute(ON)
        assert_equal(true, @@vmr.strip[7].mute)
    end

    def test_it_sets_and_gets_strip7_mute_on_with_alias
        @@vmr.strip[8].mute(ON)
        assert_equal(true, @@vmr.strip[8].mute)
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

    def test_it_sets_and_gets_strip5_mute_off_with_alias
        @@vmr.strip[6].mute(OFF)
        assert_equal(false, @@vmr.strip[6].mute)
    end

    def test_it_sets_and_gets_strip6_mute_off_with_alias
        @@vmr.strip[7].mute(OFF)
        assert_equal(false, @@vmr.strip[7].mute)
    end

    def test_it_sets_and_gets_strip7_mute_off_with_alias
        @@vmr.strip[8].mute(OFF)
        assert_equal(false, @@vmr.strip[8].mute)
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

    def test_it_sets_and_gets_strip3_mono_on_with_alias
        @@vmr.strip[4].mono(ON)
        assert_equal(true, @@vmr.strip[4].mono)
    end

    def test_it_sets_and_gets_strip4_mono_on_with_alias
        @@vmr.strip[5].mono(ON)
        assert_equal(true, @@vmr.strip[5].mono)
    end

    def test_it_sets_and_gets_strip5_mc_on_with_alias
        @@vmr.strip[6].mc(ON)
        assert_equal(true, @@vmr.strip[6].mc)
    end

    def test_it_sets_and_gets_strip6_k_on_with_alias
        @@vmr.strip[7].k(ON)
        assert_equal(true, @@vmr.strip[7].k)
    end

    def test_it_sets_and_gets_strip7_mc_on_with_alias
        @@vmr.strip[8].mc(ON)
        assert_equal(true, @@vmr.strip[8].mc)
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

    def test_it_sets_and_gets_strip4_mc_off_with_alias
        @@vmr.strip[5].mc(OFF)
        assert_equal(false, @@vmr.strip[5].mc)
    end

    def test_it_sets_and_gets_strip5_mc_off_with_alias
        @@vmr.strip[6].mc(OFF)
        assert_equal(false, @@vmr.strip[6].mc)
    end

    def test_it_sets_and_gets_strip6_k_off_with_alias
        @@vmr.strip[7].k(OFF)
        assert_equal(false, @@vmr.strip[7].k)
    end

    def test_it_sets_and_gets_strip7_mc_off_with_alias
        @@vmr.strip[8].mc(OFF)
        assert_equal(false, @@vmr.strip[8].mc)
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

    def test_it_sets_and_gets_strip5_solo_on_with_alias
        @@vmr.strip[6].solo(ON)
        assert_equal(true, @@vmr.strip[6].solo)
    end

    def test_it_sets_and_gets_strip6_solo_on_with_alias
        @@vmr.strip[7].solo(ON)
        assert_equal(true, @@vmr.strip[7].solo)
    end

    def test_it_sets_and_gets_strip7_solo_on_with_alias
        @@vmr.strip[8].solo(ON)
        assert_equal(true, @@vmr.strip[8].solo)
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

    def test_it_sets_and_gets_strip5_solo_off_with_alias
        @@vmr.strip[6].solo(OFF)
        assert_equal(false, @@vmr.strip[6].solo)
    end

    def test_it_sets_and_gets_strip6_solo_off_with_alias
        @@vmr.strip[7].solo(OFF)
        assert_equal(false, @@vmr.strip[7].solo)
    end

    def test_it_sets_and_gets_strip7_solo_off_with_alias
        @@vmr.strip[8].solo(OFF)
        assert_equal(false, @@vmr.strip[8].solo)
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

    def test_it_sets_and_gets_strip5_A1_on_with_alias
        @@vmr.strip[6].A1(ON)
        assert_equal(true, @@vmr.strip[6].A1)
    end

    def test_it_sets_and_gets_strip6_A1_on_with_alias
        @@vmr.strip[7].A1(ON)
        assert_equal(true, @@vmr.strip[7].A1)
    end

    def test_it_sets_and_gets_strip7_A1_on_with_alias
        @@vmr.strip[8].A1(ON)
        assert_equal(true, @@vmr.strip[8].A1)
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

    def test_it_sets_and_gets_strip5_A1_off_with_alias
        @@vmr.strip[6].A1(OFF)
        assert_equal(false, @@vmr.strip[6].A1)
    end

    def test_it_sets_and_gets_strip6_A1_off_with_alias
        @@vmr.strip[7].A1(OFF)
        assert_equal(false, @@vmr.strip[7].A1)
    end

    def test_it_sets_and_gets_strip7_A1_off_with_alias
        @@vmr.strip[8].A1(OFF)
        assert_equal(false, @@vmr.strip[8].A1)
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

    def test_it_sets_and_gets_strip5_B1_on_with_alias
        @@vmr.strip[6].B1(ON)
        assert_equal(true, @@vmr.strip[6].B1)
    end

    def test_it_sets_and_gets_strip6_B1_on_with_alias
        @@vmr.strip[7].B1(ON)
        assert_equal(true, @@vmr.strip[7].B1)
    end

    def test_it_sets_and_gets_strip7_B1_on_with_alias
        @@vmr.strip[8].B1(ON)
        assert_equal(true, @@vmr.strip[8].B1)
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

    def test_it_sets_and_gets_strip5_B1_off_with_alias
        @@vmr.strip[6].B1(OFF)
        assert_equal(false, @@vmr.strip[6].B1)
    end

    def test_it_sets_and_gets_strip6_B1_off_with_alias
        @@vmr.strip[7].B1(OFF)
        assert_equal(false, @@vmr.strip[7].B1)
    end

    def test_it_sets_and_gets_strip7_B1_off_with_alias
        @@vmr.strip[8].B1(OFF)
        assert_equal(false, @@vmr.strip[8].B1)
    end

    def test_it_sets_and_gets_bus0_EQ_on_with_alias
        @@vmr.bus[1].EQ(ON)
        assert_equal(true, @@vmr.bus[1].EQ)
    end

    def test_it_sets_and_gets_bus0_EQ_off_with_alias
        @@vmr.bus[1].EQ(OFF)
        assert_equal(false, @@vmr.bus[1].EQ)
    end

    def test_it_sets_and_gets_bus1_EQ_on_with_alias
        @@vmr.bus[2].EQ(ON)
        assert_equal(true, @@vmr.bus[2].EQ)
    end

    def test_it_sets_and_gets_bus1_EQ_off_with_alias
        @@vmr.bus[2].EQ(OFF)
        assert_equal(false, @@vmr.bus[2].EQ)
    end

    def test_it_sets_and_gets_bus2_EQ_on_with_alias
        @@vmr.bus[3].EQ(ON)
        assert_equal(true, @@vmr.bus[3].EQ)
    end

    def test_it_sets_and_gets_bus2_EQ_off_with_alias
        @@vmr.bus[3].EQ(OFF)
        assert_equal(false, @@vmr.bus[3].EQ)
    end

    def test_it_sets_and_gets_bus3_EQ_on_with_alias
        @@vmr.bus[4].EQ(ON)
        assert_equal(true, @@vmr.bus[4].EQ)
    end

    def test_it_sets_and_gets_bus3_EQ_off_with_alias
        @@vmr.bus[4].EQ(OFF)
        assert_equal(false, @@vmr.bus[4].EQ)
    end

    def test_it_sets_and_gets_bus4_EQ_on_with_alias
        @@vmr.bus[5].EQ(ON)
        assert_equal(true, @@vmr.bus[5].EQ)
    end

    def test_it_sets_and_gets_bus4_EQ_off_with_alias
        @@vmr.bus[5].EQ(OFF)
        assert_equal(false, @@vmr.bus[5].EQ)
    end

    def test_it_sets_and_gets_bus5_EQ_on_with_alias
        @@vmr.bus[6].EQ(ON)
        assert_equal(true, @@vmr.bus[6].EQ)
    end

    def test_it_sets_and_gets_bus5_EQ_off_with_alias
        @@vmr.bus[6].EQ(OFF)
        assert_equal(false, @@vmr.bus[6].EQ)
    end

    def test_it_sets_and_gets_bus6_EQ_on_with_alias
        @@vmr.bus[7].EQ(ON)
        assert_equal(true, @@vmr.bus[7].EQ)
    end

    def test_it_sets_and_gets_bus6_EQ_off_with_alias
        @@vmr.bus[7].EQ(OFF)
        assert_equal(false, @@vmr.bus[7].EQ)
    end

    def test_it_sets_and_gets_bus7_EQ_on_with_alias
        @@vmr.bus[8].EQ(ON)
        assert_equal(true, @@vmr.bus[8].EQ)
    end

    def test_it_sets_and_gets_bus7_EQ_off_with_alias
        @@vmr.bus[8].EQ(OFF)
        assert_equal(false, @@vmr.bus[8].EQ)
    end
end
