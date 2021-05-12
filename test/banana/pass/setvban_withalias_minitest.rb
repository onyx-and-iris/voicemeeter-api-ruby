require_relative '../minitest_helper'

class SetAndGetVBANONWithAlias < Minitest::Test
    def test_it_sets_and_gets_vban_instream0_on
        @@vmr.vban_in[1].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].on, true)
    end

    def test_it_sets_and_gets_vban_instream0_off
        @@vmr.vban_in[1].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].on, false)
    end

    def test_it_sets_and_gets_vban_instream1_on
        @@vmr.vban_in[2].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].on, true)
    end

    def test_it_sets_and_gets_vban_instream1_off
        @@vmr.vban_in[2].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].on, false)
    end

    def test_it_sets_and_gets_vban_instream2_on
        @@vmr.vban_in[3].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].on, true)
    end

    def test_it_sets_and_gets_vban_instream2_off
        @@vmr.vban_in[3].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].on, false)
    end

    def test_it_sets_and_gets_vban_outstream0_on
        @@vmr.vban_out[1].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].on, true)
    end

    def test_it_sets_and_gets_vban_outstream0_off
        @@vmr.vban_out[1].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].on, false)
    end

    def test_it_sets_and_gets_vban_outstream1_on
        @@vmr.vban_out[2].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].on, true)
    end

    def test_it_sets_and_gets_vban_outstream1_off
        @@vmr.vban_out[2].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].on, false)
    end

    def test_it_sets_and_gets_vban_outstream2_on
        @@vmr.vban_out[3].on = true
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].on, true)
    end

    def test_it_sets_and_gets_vban_outstream2_off
        @@vmr.vban_out[3].on = false
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].on, false)
    end
end

class SetAndGetVBANNAMEWithAlias < Minitest::Test
    def test_it_sets_and_gets_vban_instream0_name_test0
        @@vmr.vban_in[1].name = 'test0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].name, 'test0')
    end

    def test_it_sets_and_gets_vban_instream0_name_test1
        @@vmr.vban_in[1].name = 'test1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].name, 'test1')
    end

    def test_it_sets_and_gets_vban_instream1_name_test2
        @@vmr.vban_in[2].name = 'test2'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].name, 'test2')
    end

    def test_it_sets_and_gets_vban_instream1_name_test3
        @@vmr.vban_in[2].name = 'test3'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].name, 'test3')
    end

    def test_it_sets_and_gets_vban_instream2_name_test4
        @@vmr.vban_in[3].name = 'test4'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].name, 'test4')
    end

    def test_it_sets_and_gets_vban_instream2_name_test5
        @@vmr.vban_in[3].name = 'test5'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].name, 'test5')
    end

    def test_it_sets_and_gets_vban_outstream0_name_test0
        @@vmr.vban_out[1].name = 'test0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].name, 'test0')
    end

    def test_it_sets_and_gets_vban_outstream0_name_test1
        @@vmr.vban_out[1].name = 'test1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].name, 'test1')
    end

    def test_it_sets_and_gets_vban_outstream1_name_test2
        @@vmr.vban_out[2].name = 'test2'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].name, 'test2')
    end

    def test_it_sets_and_gets_vban_outstream1_name_test3
        @@vmr.vban_out[2].name = 'test3'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].name, 'test3')
    end

    def test_it_sets_and_gets_vban_outstream2_name_test4
        @@vmr.vban_out[3].name = 'test4'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].name, 'test4')
    end

    def test_it_sets_and_gets_vban_outstream2_name_test5
        @@vmr.vban_out[3].name = 'test5'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].name, 'test5')
    end
end

class SetAndGetVBANIPWithAlias < Minitest::Test
    def test_it_sets_and_gets_vban_instream0_ip_0000
        @@vmr.vban_in[1].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_instream0_ip_127
        @@vmr.vban_in[1].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].ip, '127.0.0.1')
    end

    def test_it_sets_and_gets_vban_instream1_ip_0000
        @@vmr.vban_in[2].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_instream1_ip_127
        @@vmr.vban_in[2].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].ip, '127.0.0.1')
    end

    def test_it_sets_and_gets_vban_instream2_ip_0000
        @@vmr.vban_in[3].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_instream2_ip_127
        @@vmr.vban_in[3].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].ip, '127.0.0.1')
    end

    def test_it_sets_and_gets_vban_outstream0_ip_0000
        @@vmr.vban_out[1].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_outstream0_ip_127
        @@vmr.vban_out[1].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].ip, '127.0.0.1')
    end

    def test_it_sets_and_gets_vban_outstream1_ip_0000
        @@vmr.vban_out[2].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_outstream1_ip_127
        @@vmr.vban_out[2].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].ip, '127.0.0.1')
    end

    def test_it_sets_and_gets_vban_outstream2_ip_0000
        @@vmr.vban_out[3].ip = '0.0.0.0'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].ip, '0.0.0.0')
    end

    def test_it_sets_and_gets_vban_outstream2_ip_127
        @@vmr.vban_out[3].ip = '127.0.0.1'
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].ip, '127.0.0.1')
    end
end


class SetAndGetVBANSRWithAlias < Minitest::Test
    def test_it_gets_vban_instream0_sr_48000
        assert_equal(@@vmr.vban_in[1].sr, 48000)
    end

    def test_it_gets_vban_instream1_sr_48000
        assert_equal(@@vmr.vban_in[2].sr, 48000)
    end

    def test_it_gets_vban_instream2_sr_48000
        assert_equal(@@vmr.vban_in[3].sr, 48000)
    end

    def test_it_sets_and_gets_vban_outstream0_sr_44100
        @@vmr.vban_out[1].sr = 44100
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].sr, 44100)
    end

    def test_it_sets_and_gets_vban_outstream0_sr_48000
        @@vmr.vban_out[1].sr = 48000
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].sr, 48000)
    end

    def test_it_sets_and_gets_vban_outstream1_sr_44100
        @@vmr.vban_out[2].sr = 44100
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].sr, 44100)
    end

    def test_it_sets_and_gets_vban_outstream1_sr_48000
        @@vmr.vban_out[2].sr = 48000
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].sr, 48000)
    end

    def test_it_sets_and_gets_vban_outstream2_sr_44100
        @@vmr.vban_out[3].sr = 44100
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].sr, 44100)
    end

    def test_it_sets_and_gets_vban_outstream2_sr_48000
        @@vmr.vban_out[3].sr = 48000
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].sr, 48000)
    end
end

class SetAndGetVBANChannelWithAlias < Minitest::Test
    def test_it_gets_vban_instream0_channel_count
        assert_equal(@@vmr.vban_in[1].channel, 2)
    end

    def test_it_gets_vban_instream1_channel_count
        assert_equal(@@vmr.vban_in[2].channel, 2)
    end

    def test_it_gets_vban_instream2_channel_count
        assert_equal(@@vmr.vban_in[3].channel, 2)
    end

    def test_it_sets_and_gets_vban_outstream0_channel_count_1
        @@vmr.vban_out[1].channel = 1
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].channel, 1)
    end

    def test_it_sets_and_gets_vban_outstream0_channel_count_2
        @@vmr.vban_out[1].channel = 2
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].channel, 2)
    end

    def test_it_sets_and_gets_vban_outstream1_channel_count_3
        @@vmr.vban_out[2].channel = 3
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].channel, 3)
    end

    def test_it_sets_and_gets_vban_outstream1_channel_count_4
        @@vmr.vban_out[2].channel = 4
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].channel, 4)
    end

    def test_it_sets_and_gets_vban_outstream2_channel_count_5
        @@vmr.vban_out[3].channel = 5
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].channel, 5)
    end

    def test_it_sets_and_gets_vban_outstream2_channel_count_6
        @@vmr.vban_out[3].channel = 6
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].channel, 6)
    end
end

class SetAndGetVBANBitWithAlias < Minitest::Test
    def test_it_gets_vban_instream0_bit
        assert_equal(@@vmr.vban_in[1].bit, 16)
    end

    def test_it_gets_vban_instream1_bit
        assert_equal(@@vmr.vban_in[2].bit, 16)
    end

    def test_it_gets_vban_instream2_bit
        assert_equal(@@vmr.vban_in[3].bit, 16)
    end

    def test_it_sets_and_gets_vban_outstream0_bit_16
        @@vmr.vban_out[1].bit = 16
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].bit, 16)
    end

    def test_it_sets_and_gets_vban_outstream0_bit_24
        @@vmr.vban_out[1].bit = 24
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].bit, 24)
    end

    def test_it_sets_and_gets_vban_outstream1_bit_16
        @@vmr.vban_out[2].bit = 16
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].bit, 16)
    end

    def test_it_sets_and_gets_vban_outstream1_bit_24
        @@vmr.vban_out[2].bit = 24
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].bit, 24)
    end

    def test_it_sets_and_gets_vban_outstream2_bit_16
        @@vmr.vban_out[3].bit = 16
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].bit, 16)
    end

    def test_it_sets_and_gets_vban_outstream2_bit_24
        @@vmr.vban_out[3].bit = 24
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].bit, 24)
    end
end

class SetAndGetVBANRouteWithAlias < Minitest::Test
    def test_it_sets_and_gets_vban_instream0_route_0
        @@vmr.vban_in[1].route = 0
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[1].route, 0)
    end

    def test_it_sets_and_gets_vban_instream1_route_1
        @@vmr.vban_in[2].route = 1
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[2].route, 1)
    end

    def test_it_sets_and_gets_vban_instream2_route_2
        @@vmr.vban_in[3].route = 2
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[3].route, 2)
    end

    def test_it_sets_and_gets_vban_instream3_route_3
        @@vmr.vban_in[4].route = 3
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_in[4].route, 3)
    end

    def test_it_sets_and_gets_vban_outstream0_route_0
        @@vmr.vban_out[1].route = 0
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[1].route, 0)
    end

    def test_it_sets_and_gets_vban_outstream1_route_1
        @@vmr.vban_out[2].route = 1
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[2].route, 1)
    end

    def test_it_sets_and_gets_vban_outstream2_route_2
        @@vmr.vban_out[3].route = 2
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[3].route, 2)
    end

    def test_it_sets_and_gets_vban_outstream3_route_3
        @@vmr.vban_out[4].route = 3
        assert_equal(SUCCESS, @@vmr.ret)
        assert_equal(@@vmr.vban_out[4].route, 3)
    end
end
