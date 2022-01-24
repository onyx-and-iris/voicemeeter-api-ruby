require_relative '../minitest_helper'


class SetAndGetStrip < Minitest::Test
    # bool tests
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

    def test_it_sets_and_gets_strip3_mc_true
        @@vmr.strip[3].mc = true
        assert_equal(true, @@vmr.strip[3].mc)
    end

    def test_it_sets_and_gets_strip1_mc_false
        @@vmr.strip[3].mc = false
        assert_equal(false, @@vmr.strip[3].mc)
    end

    def test_it_sets_and_gets_strip4_k_true
        @@vmr.strip[4].k = true
        assert_equal(true, @@vmr.strip[4].k)
    end

    def test_it_sets_and_gets_strip4_k_false
        @@vmr.strip[4].k = false
        assert_equal(false, @@vmr.strip[4].k)
    end

    # float tests
    def test_it_sets_and_gets_strip2_gain_37
        @@vmr.strip[2].gain = 3.7
        assert_equal(3.7, @@vmr.strip[2].gain)
    end

    def test_it_sets_and_gets_strip2_gain_52
        @@vmr.strip[2].gain = -5.2
        assert_equal(-5.2, @@vmr.strip[2].gain)
    end

    # int tests
    def test_it_sets_and_gets_strip2_limit_10
        @@vmr.strip[2].limit = -10
        assert_equal(-10, @@vmr.strip[2].limit)
    end

    def test_it_sets_and_gets_strip5_limit_34
        @@vmr.strip[2].limit = -34
        assert_equal(-34, @@vmr.strip[2].limit)
    end
end


class SetAndGetBus < Minitest::Test
    # bool tests
    def test_it_sets_and_gets_bus4_eq_true
        @@vmr.bus[4].eq = true
        assert_equal(true, @@vmr.bus[4].eq)
    end

    def test_it_sets_and_gets_bus4_eq_false
        @@vmr.bus[4].eq = false
        assert_equal(false, @@vmr.bus[4].eq)
    end

    # float tests
    def test_it_sets_and_gets_bus2_gain_105
        @@vmr.bus[2].gain = -10.5
        assert_equal(-10.5, @@vmr.bus[2].gain)
    end

    def test_it_sets_and_gets_bus2_gain_35
        @@vmr.bus[2].gain = 3.5
        assert_equal(3.5, @@vmr.bus[2].gain)
    end

    # string tests
    def test_it_sets_and_gets_bus3_label_test0
        @@vmr.bus[3].label = 'test0'
        assert_equal(-'test0', @@vmr.bus[3].label)
    end

    def test_it_sets_and_gets_bus3_label_test1
        @@vmr.bus[3].label = 'test0'
        assert_equal('test0', @@vmr.bus[3].label)
    end
end


class SetAndGetVban < Minitest::Test
    # bool tests
    def test_it_sets_and_gets_vban_instream0_on
        @@vmr.vban.instream[0].on = true
        assert_equal(true, @@vmr.vban.instream[0].on)
    end

    def test_it_sets_and_gets_vban_instream0_off
        @@vmr.vban.instream[0].on = false
        assert_equal(false, @@vmr.vban.instream[0].on)
    end

    # string tests
    def test_it_sets_and_gets_vban_instream4_name_test
        @@vmr.vban.instream[4].name = 'test'
        assert_equal('test', @@vmr.vban.instream[4].name)
    end

    def test_it_sets_and_gets_vban_instream4_name_stream5
        @@vmr.vban.instream[4].name = 'Stream5'
        assert_equal('Stream5', @@vmr.vban.instream[4].name)
    end

    def test_it_sets_and_gets_vban_outstream6_ip_0000
        @@vmr.vban.outstream[6].ip = '0.0.0.0'
        assert_equal('0.0.0.0', @@vmr.vban.outstream[6].ip)
    end

    def test_it_sets_and_gets_vban_outstream6_ip_127001
        @@vmr.vban.outstream[6].ip = '127.0.0.1'
        assert_equal('127.0.0.1', @@vmr.vban.outstream[6].ip)
    end

    # int tests
    def test_it_sets_and_gets_vban_instream2_route_0
        @@vmr.vban.instream[2].route = 0
        assert_equal(0, @@vmr.vban.instream[2].route)
    end

    def test_it_sets_and_gets_vban_instream2_route_3
        @@vmr.vban.instream[2].route = 3
        assert_equal(3, @@vmr.vban.instream[2].route)
    end

    def test_it_sets_and_gets_vban_outstream3_bit_16
        @@vmr.vban.outstream[3].bit = 16
        assert_equal(16, @@vmr.vban.outstream[3].bit)
    end

    def test_it_sets_and_gets_vban_outstream3_bit_24
        @@vmr.vban.outstream[3].bit = 24
        assert_equal(24, @@vmr.vban.outstream[3].bit)
    end
end


class SetAndGetRecorder < Minitest::Test
    # bool tests
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


class SetAndGetMacroButtons < Minitest::Test
    # bool tests
    def test_it_sets_and_gets_macrobutton5_stateonly_on
        @@vmr.button[5].stateonly = true
        assert_equal(true, @@vmr.button[5].stateonly)
    end

    def test_it_sets_and_gets_macrobutton5_stateonly_off
        @@vmr.button[5].stateonly = false
        assert_equal(false, @@vmr.button[5].stateonly)
    end

    def test_it_sets_and_gets_macrobutton32_stateonly_on
        @@vmr.button[32].trigger = true
        assert_equal(true, @@vmr.button[32].trigger)
    end

    def test_it_sets_and_gets_macrobutton32_stateonly_off
        @@vmr.button[32].trigger = false
        assert_equal(false, @@vmr.button[32].trigger)
    end
end

class SetCommands < Minitest::Test
    # bool tests
    def test_it_sets_showvbanchat_true
        @@vmr.command.showvbanchat = true
    end

    def test_it_sets_showvbanchat_false
        @@vmr.command.showvbanchat = false
    end

    def test_it_sets_lock_true
        @@vmr.command.lock = true
    end

    def test_it_sets_lock_false
        @@vmr.command.lock = false
    end
end