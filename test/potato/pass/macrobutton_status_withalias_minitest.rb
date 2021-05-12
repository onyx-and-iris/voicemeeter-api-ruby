require_relative '../minitest_helper'

class MacroButtonStatusWithAlias < Minitest::Test
    def test_it_sets_macrobutton0_state_on_with_alias
        @@vmr.button[1].state = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[1].state)
    end

    def test_it_sets_macrobutton1_state_on_with_alias
        @@vmr.button[2].state = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[2].state)
    end

    def test_it_sets_macrobutton2_state_on_with_alias
        @@vmr.button[3].state = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[3].state)
    end

    def test_it_sets_macrobutton0_state_off_with_alias
        @@vmr.button[1].state = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[1].state)
    end

    def test_it_sets_macrobutton1_state_off_with_alias
        @@vmr.button[2].state = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[2].state)
    end

    def test_it_sets_macrobutton2_state_off_with_alias
        @@vmr.button[3].state = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[3].state)
    end

    def test_it_sets_macrobutton0_stateonly_on_with_alias
        @@vmr.button[1].stateonly = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[1].stateonly)
    end

    def test_it_sets_macrobutton1_stateonly_on_with_alias
        @@vmr.button[2].stateonly = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[2].stateonly)
    end

    def test_it_sets_macrobutton2_stateonly_on_with_alias
        @@vmr.button[3].stateonly = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[3].stateonly)
    end

    def test_it_sets_macrobutton0_stateonly_off_with_alias
        @@vmr.button[1].stateonly = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[1].stateonly)
    end

    def test_it_sets_macrobutton1_stateonly_off_with_alias
        @@vmr.button[2].stateonly = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[2].stateonly)
    end

    def test_it_sets_macrobutton2_stateonly_off_with_alias
        @@vmr.button[3].stateonly = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[3].stateonly)
    end

    def test_it_sets_macrobutton0_trigger_on_with_alias
        @@vmr.button[1].trigger = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[1].trigger)
    end

    def test_it_sets_macrobutton1_trigger_on_with_alias
        @@vmr.button[2].trigger = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[2].trigger)
    end

    def test_it_sets_macrobutton2_trigger_on_with_alias
        @@vmr.button[3].trigger = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(true, @@vmr.button[3].trigger)
    end

    def test_it_sets_macrobutton0_trigger_off_with_alias
        @@vmr.button[1].trigger = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[1].trigger)
    end

    def test_it_sets_macrobutton1_trigger_off_with_alias
        @@vmr.button[2].trigger = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[2].trigger)
    end

    def test_it_sets_macrobutton2_trigger_off_with_alias
        @@vmr.button[3].trigger = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(false, @@vmr.button[3].trigger)
    end
end
