require_relative '../minitest_helper_base0'

class MacroButtonStatusWithAliasBase0 < Minitest::Test
    def test_it_sets_macrobutton0_state_on_with_alias
        @@vmr.button[0].state = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[0].state)
    end

    def test_it_sets_macrobutton1_state_on_with_alias
        @@vmr.button[1].state = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[1].state)
    end

    def test_it_sets_macrobutton2_state_on_with_alias
        @@vmr.button[2].state = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[2].state)
    end

    def test_it_sets_macrobutton0_state_off_with_alias
        @@vmr.button[0].state = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[0].state)
    end

    def test_it_sets_macrobutton1_state_off_with_alias
        @@vmr.button[1].state = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[1].state)
    end

    def test_it_sets_macrobutton2_state_off_with_alias
        @@vmr.button[2].state = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[2].state)
    end

    def test_it_sets_macrobutton0_stateonly_on_with_alias
        @@vmr.button[0].stateonly = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[0].stateonly)
    end

    def test_it_sets_macrobutton1_stateonly_on_with_alias
        @@vmr.button[1].stateonly = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[1].stateonly)
    end

    def test_it_sets_macrobutton2_stateonly_on_with_alias
        @@vmr.button[2].stateonly = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[2].stateonly)
    end

    def test_it_sets_macrobutton0_stateonly_off_with_alias
        @@vmr.button[0].stateonly = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[0].stateonly)
    end

    def test_it_sets_macrobutton1_stateonly_off_with_alias
        @@vmr.button[1].stateonly = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[1].stateonly)
    end

    def test_it_sets_macrobutton2_stateonly_off_with_alias
        @@vmr.button[2].stateonly = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[2].stateonly)
    end

    def test_it_sets_macrobutton0_trigger_on_with_alias
        @@vmr.button[0].trigger = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[0].trigger)
    end

    def test_it_sets_macrobutton1_trigger_on_with_alias
        @@vmr.button[1].trigger = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[1].trigger)
    end

    def test_it_sets_macrobutton2_trigger_on_with_alias
        @@vmr.button[2].trigger = ON
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(ON, @@vmr.button[2].trigger)
    end

    def test_it_sets_macrobutton0_trigger_off_with_alias
        @@vmr.button[0].trigger = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[0].trigger)
    end

    def test_it_sets_macrobutton1_trigger_off_with_alias
        @@vmr.button[1].trigger = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[1].trigger)
    end

    def test_it_sets_macrobutton2_trigger_off_with_alias
        @@vmr.button[2].trigger = OFF
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(OFF, @@vmr.button[2].trigger)
    end
end
