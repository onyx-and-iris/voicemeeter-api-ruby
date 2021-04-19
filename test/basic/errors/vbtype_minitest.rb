require 'minitest/autorun'
require 'routines'


class VBTypeErrorTest < MiniTest::Test
    def test_it_raises_a_vbtype_error_on_login
        """ 
        ERROR: Unknown Voicemeeter type
        """
        assert_raises(VBTypeError) do
            vmr = Remote.new("garbagevalue")
        end
    end
end
