require_relative '../minitest_helper'


class SetAndGetParamsFloat < Minitest::Test
    def test_it_sets_and_gets_strip0_mono_on
        @@vmr.set_parameter("Strip[0].mono", 1)
        assert_equal(1, @@vmr.get_parameter("Strip[0].mono"))
    end

    def test_it_sets_and_gets_strip0_mono_off
        @@vmr.set_parameter("Strip[0].mono", 0)
        assert_equal(0, @@vmr.get_parameter("Strip[0].mono"))
    end

    def test_it_sets_and_gets_strip3_mute_on
        @@vmr.set_parameter("Strip[3].mute", 1)
        assert_equal(1, @@vmr.get_parameter("Strip[3].mute"))
    end

    def test_it_sets_and_gets_strip3_mute_off
        @@vmr.set_parameter("Strip[3].mute", 0)
        assert_equal(0, @@vmr.get_parameter("Strip[3].mute"))
    end
end


class SetAndGetParamsString < Minitest::Test
    def test_it_sets_and_gets_strip0_label_test0
        @@vmr.set_parameter("Strip[0].label", "test0")
        assert_equal("test0", @@vmr.get_parameter("Strip[0].label", true))
    end

    def test_it_sets_and_gets_strip0_label_test1
        @@vmr.set_parameter("Strip[0].label", "test1")
        assert_equal("test1", @@vmr.get_parameter("Strip[0].label", true))
    end
end


class SetAndGetMacroButtonStatus < Minitest::Test
    def test_it_sets_and_gets_macrobutton0_stateonly_on
        id, set, mode = 0, 1, 2
        @@vmr.macro_setstatus(id, set, mode)
        assert_equal(1, @@vmr.macro_getstatus(id, mode))
    end

    def test_it_sets_and_gets_macrobutton0_stateonly_off
        id, set, mode = 0, 0, 2
        @@vmr.macro_setstatus(id, set, mode)
        assert_equal(0, @@vmr.macro_getstatus(id, mode))
    end

    def test_it_sets_and_gets_macrobutton20_trigger_on
        id, set, mode = 20, 1, 3
        @@vmr.macro_setstatus(id, set, mode)
        assert_equal(1, @@vmr.macro_getstatus(id, mode))
    end

    def test_it_sets_and_gets_macrobutton20_trigger_off
        id, set, mode = 20, 0, 3
        @@vmr.macro_setstatus(id, set, mode)
        assert_equal(0, @@vmr.macro_getstatus(id, mode))
    end
end
