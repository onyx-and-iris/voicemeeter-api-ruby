require 'ffi'
require_relative 'inst'

include InstallationFunctions

module Base
    """
    Perform low level tasks.
    """
    extend FFI::Library

    begin
        OS_BITS = get_arch
        VM_PATH = get_vmpath(OS_BITS)
        DLL_NAME = "VoicemeeterRemote#{OS_BITS == 64 ? "64" : ""}.dll"

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

    def pdirty
        return vmr_pdirty&.nonzero?
    end

    def mdirty
        return vmr_mdirty&.nonzero?
    end

    def clear_polling
        while self.pdirty || self.mdirty
        end
    end

    def polling(func, **kwargs)
        params = {
            "get_parameter" => kwargs[:name],
            "macro_getstatus" => "mb_#{kwargs[:id]}_#{kwargs[:mode]}"
        }
        @max_polls.times do |i|
            if @cache.key? params[func]
                if func.include?('param') && self.pdirty ||
                func.include?('macro') && self.mdirty
                    return @cache.delete(params[func])[0]
                end
                sleep(DELAY)
                break if @cache[params[func]][1] == false && i == 1
            end
        end

        val = yield
        @cache.store(params[func], [val, false])
        val
    end

    def retval=(values)
        """ Writer validation for CAPI calls """
        retval, func = *values
        raise CAPIErrors.new(retval, func) if retval&.nonzero?
        @retval = retval
    end

    def run_as(func, *args)
        val = send('vmr_' + func, *args)
        self.retval = [val, func]
        sleep(DELAY) if func.include?('set') && @wait
    end
end

module Define_Version
    """
    Defines the console layout for a specific kind of Voicemeeter.
    """
    include Base

    def define_version(kind)
        case kind
        when "basic"
            @properties = {
                :name => kind,
                :exe => "voicemeeter.exe",
            }
            @layout = {
                :strip => {:p_in => 2, :v_in=> 1},
                :bus => {:p_out => 1, :v_out=> 1},
                :vban => {:instream => 4, :outstream => 4},
                :mb => 70,
            }
        when "banana"
            @properties = {
                :name => kind,
                :exe => "voicemeeterpro.exe",
            }
            @layout = {
                :strip => {:p_in => 3, :v_in=> 2},
                :bus => {:p_out => 3, :v_out=> 2},
                :vban => {:instream => 8, :outstream => 8},
                :mb => 70,
            }
        when "potato"
            @properties = {
                :name => kind,
                :exe => "voicemeeter8#{OS_BITS == 64 ? "x64" : ""}.exe",
            }
            @layout = {
                :strip => {:p_in => 5, :v_in=> 3},
                :bus => {:p_out => 5, :v_out=> 3},
                :vban => {:instream => 8, :outstream => 8},
                :mb => 70,
            }
        end
    end
end
