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

class SetParamMultiBase0 < Minitest::Test
    def test_it_sets_multiple_params_on_by_hash
        @@param_hash.each do |key, index|
            index.each do |k, v|
                @@param_hash[key][k] = ON
            end
        end

        @@vmr.set_parameter_multi(@@param_hash)
        assert_equal(SUCCESS, @@vmr.ret)
        0.upto(1) do |num|
            [
                "Strip[#{num}].mute",
                "Strip[#{num}].gain",
                "Strip[#{num}].A1",
                "Bus[#{num}].mute",
                "Bus[#{num}].gain",
                "Bus[#{num}].mono"
            ].each do |param|
                a = ["mute", "A1", "mono"]
                b = param
                if a.any? { |s| b.include? s }
                    expected = ON
                else
                    expected = 1.0
                end

                assert_equal(expected, @@vmr.get_parameter(param))
            end
        end
    end

    def test_it_sets_multiple_params_off_by_hash
        @@param_hash.each do |key, index|
            index.each do |k, v|
                @@param_hash[key][k] = OFF
            end
        end

        @@vmr.set_parameter_multi(@@param_hash)
        assert_equal(SUCCESS, @@vmr.ret)
        0.upto(1) do |num|
            [
                "Strip[#{num}].mute",
                "Strip[#{num}].gain",
                "Strip[#{num}].A1",
                "Bus[#{num}].mute",
                "Bus[#{num}].gain",
                "Bus[#{num}].mono"
            ].each do |param|
                a = ["mute", "A1", "mono"]
                b = param
                if a.any? { |s| b.include? s }
                    expected = OFF
                else
                    expected = 0.0
                end

                assert_equal(expected, @@vmr.get_parameter(param))
            end
        end
    end
end