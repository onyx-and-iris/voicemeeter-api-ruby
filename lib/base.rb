require 'ffi'
require_relative 'inst'

include InstallationFunctions

module Base
    extend FFI::Library

    OS_BITS = get_arch
    VM_PATH = get_vmpath(OS_BITS)

    dll_name = "VoicemeeterRemote#{OS_BITS == 64 ? "64" : ""}.dll"

    begin
        self.vmr_dll = VM_PATH.join(dll_name)
    rescue InstallErrors => error
        puts "ERROR: #{error.message}"
        raise
    end

    ffi_lib @vmr_dll
    ffi_convention :stdcall

    attach_function :vmr_login, :VBVMR_Login, [], :long
    attach_function :vmr_logout, :VBVMR_Logout, [], :long
    attach_function :vmr_runvb, :VBVMR_RunVoicemeeter, [:long], :long
    attach_function :vmr_vbtype, :VBVMR_GetVoicemeeterType, [:pointer], :long

    attach_function :vmr_mdirty, :VBVMR_MacroButton_IsDirty, [], :long
    attach_function :vmr_macro_setstatus, :VBVMR_MacroButton_SetStatus, \
    [:long, :float, :long], :long
    attach_function :vmr_macro_getstatus, :VBVMR_MacroButton_GetStatus, \
    [:long, :pointer, :long], :long

    attach_function :vmr_pdirty, :VBVMR_IsParametersDirty, [], :long
    attach_function :vmr_set_parameter_float, :VBVMR_SetParameterFloat, \
    [:string, :float], :long
    attach_function :vmr_get_parameter_float, :VBVMR_GetParameterFloat, \
    [:string, :pointer], :long

    attach_function :vmr_set_parameter_string, :VBVMR_SetParameterStringA, \
    [:string, :string], :long
    attach_function :vmr_get_parameter_string, :VBVMR_GetParameterStringA, \
    [:string, :pointer], :long

    attach_function :vmr_set_parameter_multi, :VBVMR_SetParameters, \
    [:string], :long

    DELAY = 0.001
    MAX_POLLS = 8

    def polling(func)
        MAX_POLLS.times do
            break if func.include?('param') && !self.pdirty
            break if func.include?('macro') && !self.mdirty

            sleep(DELAY)
        end
    end

    def run_as(func, *args)
        val = send('vmr_' + func, *args)
        self.retval = [val, func]
        sleep(DELAY * 20) if func.include? 'set_param'
        sleep(DELAY * 50) if func.include? 'macro_set'

        @retval
    end
end
