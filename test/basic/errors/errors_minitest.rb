require_relative '../minitest_helper'

class ConnectionErrorsTests < Minitest::Test
    def test_it_raises_a_login_error
        """ 
        LoginError: Failed to login, success return value: -1
        """
        assert_raises(LoginError) do
            @@vmr.logged_in = -1
        end
    end

    def test_it_raises_a_logout_error
        """ 
        LogoutError: There was an error logging out
        """
        assert_raises(LogoutError) do
            @@vmr.logged_out = -1
        end
    end

    def test_it_raises_a_vbtype_error_0
        """ 
        VBTypeError: Unknown Voicemeeter type in type=
        """
        assert_raises(VBTypeError) do
            @@vmr.type = 0
        end
    end

    def test_it_raises_a_vbtype_error_4
        """ 
        VBTypeError: Unknown Voicemeeter type in type=
        """
        assert_raises(VBTypeError) do
            @@vmr.type = 4
        end
    end    
end

class BaseErrorsTests < Minitest::Test
    def test_it_raises_a_capi_error
        """ 
        CAPIError: Callback Function Error, return value: -3 in set_parameter
        """
        assert_raises(CAPIError) do
            @@vmr.set_parameter("garbagevalue", 1)
        end
    end

    def test_it_raises_a_command_error
        """ 
        CommandError: Command not supported in sp_command=
        """
        assert_raises(CommandError) do
            @@vmr.sp_command = "garbagevalue"
        end
    end

    def test_it_raises_a_valuetype_error
        """ 
        ValueTypeError: Incorrect value type in sp_value=
        """
        assert_raises(ValueTypeError) do
            @@vmr.sp_value = 1
        end
    end

    def test_it_raises_a_bounds_error_for_macrobutton_99
        """ 
        BoundsError: Logical ID out of range in macro_setstatus
        """
        assert_raises(BoundsError) do
            @@vmr.macro_setstatus(99, ON, 2)
        end
    end

    def test_it_raises_a_bounds_error_for_macrobutton_state_3
        """ 
        BoundsError: MB State out of range in macro_setstatus
        """
        assert_raises(BoundsError) do
            @@vmr.macro_setstatus(0, 3, 2)
        end
    end
end

class ValueTypeErrorTests < Minitest::Test
    def test_it_raises_a_valuetype_error_for_macrobutton0_1
        """ 
        ValueTypeError: Incorrect value type, expected type bool in setter 
        """
        assert_raises(ValueTypeError) do
            @@vmr.button[1].stateonly = 2
        end
    end

    def test_it_raises_a_valuetype_error_for_macrobutton0_minus1
        """ 
        ValueTypeError: Incorrect value type, expected type bool in setter 
        """
        assert_raises(ValueTypeError) do
            @@vmr.button[1].stateonly(-1)
        end
    end

    def test_it_raises_a_valuetype_error_for_macrobutton1
        """ 
        ValueTypeError: Incorrect value type, expected type bool in setter 
        """
        assert_raises(ValueTypeError) do
            @@vmr.button[2].stateonly = "garbagevalue"
        end
    end

    def test_it_raises_a_valuetype_error_for_recorder_A1_3
        """ 
        ValueTypeError: Incorrect value type, expected type bool in setter 
        """
        assert_raises(ValueTypeError) do
            @@vmr.recorder.A1 = 3
        end
    end
end
