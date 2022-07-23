require "ffi"
require "voicemeeter/inst"

module Voicemeeter
  module CBindings
    "
    Creates Ruby bindings to the C DLL

    Performs other low level tasks
    "
    extend Voicemeeter::InstallationFunctions
    extend FFI::Library

    private

    begin
      OS_BITS = FFI::Platform::CPU.downcase == "x64" ? 64 : 32
      VM_PATH = get_vmpath(OS_BITS)
      DLL_NAME = "VoicemeeterRemote#{OS_BITS == 64 ? "64" : ""}.dll"

      self.vm_dll = VM_PATH.join(DLL_NAME)
    rescue InstallErrors => error
      puts "ERROR: #{error.message}"
      raise
    end

    ffi_lib @vm_dll
    ffi_convention :stdcall

    attach_function :vm_login, :VBVMR_Login, [], :long
    attach_function :vm_logout, :VBVMR_Logout, [], :long
    attach_function :vm_runvm, :VBVMR_RunVoicemeeter, [:long], :long
    attach_function :vm_vmtype, :VBVMR_GetVoicemeeterType, [:pointer], :long
    attach_function :vm_vmversion, :VBVMR_GetVoicemeeterVersion, [:pointer], :long

    attach_function :vm_mdirty, :VBVMR_MacroButton_IsDirty, [], :long
    attach_function :vm_get_buttonstatus,
                    :VBVMR_MacroButton_GetStatus,
                    %i[long pointer long],
                    :long
    attach_function :vm_set_buttonstatus,
                    :VBVMR_MacroButton_SetStatus,
                    %i[long float long],
                    :long

    attach_function :vm_pdirty, :VBVMR_IsParametersDirty, [], :long
    attach_function :vm_get_parameter_float,
                    :VBVMR_GetParameterFloat,
                    %i[string pointer],
                    :long
    attach_function :vm_set_parameter_float,
                    :VBVMR_SetParameterFloat,
                    %i[string float],
                    :long

    attach_function :vm_get_parameter_string,
                    :VBVMR_GetParameterStringA,
                    %i[string pointer],
                    :long
    attach_function :vm_set_parameter_string,
                    :VBVMR_SetParameterStringA,
                    %i[string string],
                    :long

    attach_function :vm_set_parameter_multi,
                    :VBVMR_SetParameters,
                    [:string],
                    :long

    attach_function :vm_get_level, :VBVMR_GetLevel, %i[long long pointer], :long

    attach_function :vm_get_num_indevices, :VBVMR_Input_GetDeviceNumber, [], :long
    attach_function :vm_get_desc_indevices,
                    :VBVMR_Input_GetDeviceDescA,
                    %i[long pointer pointer pointer],
                    :long

    attach_function :vm_get_num_outdevices,
                    :VBVMR_Output_GetDeviceNumber,
                    [],
                    :long
    attach_function :vm_get_desc_outdevices,
                    :VBVMR_Output_GetDeviceDescA,
                    %i[long pointer pointer pointer],
                    :long

    @@cdll =
      lambda { |func, *args| self.retval = [send("vm_#{func}", *args), func] }

    def clear_polling = while pdirty? || mdirty?; end

    def polling(func, **kwargs)
      params = {
        "get_parameter" => kwargs[:name],
        "get_buttonstatus" => "mb_#{kwargs[:id]}_#{kwargs[:mode]}"
      }
      return @cache.delete(params[func]) if @cache.key? params[func]

      clear_polling if @sync

      yield
    end

    def retval=(values)
      " Writer validation for CAPI calls "
      retval, func = *values
      unless %i[get_num_indevices get_num_outdevices].include? func
        raise CAPIErrors.new(retval, func) if retval&.nonzero?
      end
      @retval = retval
    end

    public

    def pdirty? = vm_pdirty&.nonzero?

    def mdirty? = vm_mdirty&.nonzero?

    def ldirty?
      @strip_buf, @bus_buf = _get_levels
      return(
        !(@cache["strip_level"] == @strip_buf && @cache["bus_level"] == @bus_buf)
      )
    end
  end
end