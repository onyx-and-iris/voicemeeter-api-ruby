require_relative '../minitest_helper'

class MacroButtonStatusBoundsError < Minitest::Test
    """ expect: ERROR: Macrobutton ID out of range """
    def test_it_raises_a_bounds_error_for_macrobutton_99
        assert_raises(BoundsError) do
            @@vmr.macro_setstatus(99, ON, 2)
        end
    end

    def test_it_raises_a_paramcom_error
        """ expect: ERROR: Command not supported """
        assert_raises(ParamComError) do
            @@vmr.special_command("garbagevalue")
        end
    end
end
