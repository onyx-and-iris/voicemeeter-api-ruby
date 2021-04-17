require_relative '../minitest_helper'

class ErrorTests < Minitest::Test
    def test_it_raises_an_api_error
        """ 
        ERROR: Callback Function Error, return value: -3 in set_parameter 
        """
        assert_raises(APIError) do
            @@vmr.set_parameter("garbagevalue", 1)
        end
    end

    def test_it_raises_a_login_error
        """ 
        ERROR: Failed to login, success return value:
        """
        assert_raises(LoginError) do
            @@vmr.logged_in = -1
        end
    end

    def test_it_raises_a_logout_error
        """ 
        ERROR: There was an error logging out 
        """
        assert_raises(LogoutError) do
            @@vmr.logged_out = -1
        end
    end

    def test_it_raises_a_vbtype_error_0
        """ 
        ERROR: Unknown Voicemeeter type
        """
        assert_raises(VBTypeError) do
            @@vmr.type = 0
        end
    end

    def test_it_raises_a_vbtype_error_4
        """ 
        ERROR: Unknown Voicemeeter type
        """
        assert_raises(VBTypeError) do
            @@vmr.type = 4
        end
    end

    def test_it_raises_a_bounds_error_for_macrobutton_99
        """ ERROR: Macrobutton ID out of range """
        assert_raises(BoundsError) do
            @@vmr.macro_setstatus(99, ON, 2)
        end
    end

    def test_it_raises_a_paramcom_error
        """ ERROR: Command not supported """
        assert_raises(CommandError) do
            @@vmr.sp_command = "garbagevalue"
        end
    end

    def test_it_raises_a_paramtype_error
        """ ERROR: Incorrect value type """
        assert_raises(ValueTypeError) do
            @@vmr.sp_value = 1
        end
    end
end
