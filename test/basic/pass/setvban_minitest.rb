require_relative '../minitest_helper'

class SetVBAN < Minitest::Test
    def test_it_sets_vban_instream0_on
        @@vmr.set_parameter("vban.instream[0].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream1_on
        @@vmr.set_parameter("vban.instream[1].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream2_on
        @@vmr.set_parameter("vban.instream[2].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream3_on
        @@vmr.set_parameter("vban.instream[3].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream0_off
        @@vmr.set_parameter("vban.instream[0].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream1_off
        @@vmr.set_parameter("vban.instream[1].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream2_off
        @@vmr.set_parameter("vban.instream[2].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_instream3_off
        @@vmr.set_parameter("vban.instream[3].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream0_on
        @@vmr.set_parameter("vban.outstream[0].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream1_on
        @@vmr.set_parameter("vban.outstream[1].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream2_on
        @@vmr.set_parameter("vban.outstream[2].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream3_on
        @@vmr.set_parameter("vban.outstream[3].on", ON)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream0_off
        @@vmr.set_parameter("vban.outstream[0].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream1_off
        @@vmr.set_parameter("vban.outstream[1].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream2_off
        @@vmr.set_parameter("vban.outstream[2].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban_outstream3_off
        @@vmr.set_parameter("vban.outstream[3].on", OFF)
        assert_equal(SUCCESS, @@vmr.ret)
    end
end

class SetVBANWithAlias < Minitest::Test
    def test_it_sets_vban0_instream0_on
        @@vmr.vban_in[0].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_instream0_off
        @@vmr.vban_in[0].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_instream0_on
        @@vmr.vban_in[1].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_instream0_off
        @@vmr.vban_in[1].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_instream0_on
        @@vmr.vban_in[2].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_instream0_off
        @@vmr.vban_in[2].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_outstream0_on
        @@vmr.vban_out[0].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_outstream0_off
        @@vmr.vban_out[0].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_outstream0_on
        @@vmr.vban_out[1].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_outstream0_off
        @@vmr.vban_out[1].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_outstream0_on
        @@vmr.vban_out[2].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_outstream0_off
        @@vmr.vban_out[2].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end
end
