require 'minitest/autorun'
require 'routines'

class MacroButtonStatusBoundsError < Minitest::Test
    def test_it_raises_a_vbtype_error_on_login
        assert_raises(VBTypeError) do
            @@vmr = Remote.new("garbagevalue", logmein=true)
        end
    end
end
