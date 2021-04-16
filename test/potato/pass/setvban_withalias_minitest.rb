require_relative '../minitest_helper'

class SetVBANWithAlias < Minitest::Test
    def test_it_sets_vban0_instream0_on
        @@vmr.vban_in[1].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_instream0_off
        @@vmr.vban_in[1].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_instream0_on
        @@vmr.vban_in[2].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_instream0_off
        @@vmr.vban_in[2].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_instream0_on
        @@vmr.vban_in[3].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_instream0_off
        @@vmr.vban_in[3].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_outstream0_on
        @@vmr.vban_out[1].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban0_outstream0_off
        @@vmr.vban_out[1].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_outstream0_on
        @@vmr.vban_out[2].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban1_outstream0_off
        @@vmr.vban_out[2].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_outstream0_on
        @@vmr.vban_out[3].enable = true
        assert_equal(SUCCESS, @@vmr.ret)
    end

    def test_it_sets_vban2_outstream0_off
        @@vmr.vban_out[3].enable = false
        assert_equal(SUCCESS, @@vmr.ret)
    end
end
