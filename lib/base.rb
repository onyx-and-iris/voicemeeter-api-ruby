require 'ffi'
require_relative 'inst'


module Base
    extend FFI::Library

    os_bits = get_arch
    vm_path = get_vmpath(os_bits)

    dll_name = "VoicemeeterRemote#{os_bits == 64 ? "64" : ""}.dll"

    begin
        self.vmr_dll = vm_path.join(dll_name)
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

    def polling
        MAX_POLLS.times do
            break if vmr_pdirty&.zero? && vmr_mdirty&.zero?
            sleep(DELAY)
        end
    end

    def run_as(func, *args)
        torun = 'vmr_' + func
        send(torun, *args)
        sleep(DELAY * 20) if torun.include? 'set'
    end
end
