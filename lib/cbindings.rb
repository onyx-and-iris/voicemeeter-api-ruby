require 'ffi'
require_relative 'inst'

include InstallationFunctions

module CBindings
    '
    Creates Ruby bindings to the C DLL

    Performs other low level tasks
    '
    extend FFI::Library

    begin
        OS_BITS = get_arch
        VM_PATH = get_vmpath(OS_BITS)
        DLL_NAME = "VoicemeeterRemote#{OS_BITS == 64 ? '64' : ''}.dll"

        self.vmr_dll = VM_PATH.join(DLL_NAME)
    rescue InstallErrors => error
        puts "ERROR: #{error.message}"
        raise
    end

    ffi_lib @vmr_dll
    ffi_convention :stdcall

    attach_function :vmr_login, :VBVMR_Login, [], :long
    attach_function :vmr_logout, :VBVMR_Logout, [], :long
    attach_function :vmr_runvm, :VBVMR_RunVoicemeeter, [:long], :long
    attach_function :vmr_vmtype, :VBVMR_GetVoicemeeterType, [:pointer], :long

    attach_function :vmr_mdirty, :VBVMR_MacroButton_IsDirty, [], :long
    attach_function :vmr_macro_setstatus,
                    :VBVMR_MacroButton_SetStatus,
                    %i[long float long],
                    :long
    attach_function :vmr_macro_getstatus,
                    :VBVMR_MacroButton_GetStatus,
                    %i[long pointer long],
                    :long

    attach_function :vmr_pdirty, :VBVMR_IsParametersDirty, [], :long
    attach_function :vmr_set_parameter_float,
                    :VBVMR_SetParameterFloat,
                    %i[string float],
                    :long
    attach_function :vmr_get_parameter_float,
                    :VBVMR_GetParameterFloat,
                    %i[string pointer],
                    :long

    attach_function :vmr_set_parameter_string,
                    :VBVMR_SetParameterStringA,
                    %i[string string],
                    :long
    attach_function :vmr_get_parameter_string,
                    :VBVMR_GetParameterStringA,
                    %i[string pointer],
                    :long

    attach_function :vmr_set_parameter_multi,
                    :VBVMR_SetParameters,
                    [:string],
                    :long

    DELAY = 0.001
    SYNC = false

    def pdirty?
        return vmr_pdirty&.nonzero?
    end

    def mdirty?
        return vmr_mdirty&.nonzero?
    end

    private

    def clear_polling
        while self.pdirty? || self.mdirty?
        end
    end

    def polling(func, **kwargs)
        params = {
            'get_parameter' => kwargs[:name],
            'macro_getstatus' => "mb_#{kwargs[:id]}_#{kwargs[:mode]}"
        }
        return @cache.delete(params[func]) if @cache.key? params[func]

        self.clear_polling if self.sync

        val = yield
    end

    def retval=(values)
        '' \
            ' Writer validation for CAPI calls ' \
            ''
        retval, func = *values
        raise CAPIErrors.new(retval, func) if retval&.nonzero?
        @retval = retval
    end

    def run_as(func, *args)
        val = send('vmr_' + func, *args)
        self.retval = [val, func]
        sleep(DELAY) if @wait
    end
end
