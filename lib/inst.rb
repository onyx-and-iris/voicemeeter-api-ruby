require 'win32/registry'
require 'pathname'
require_relative 'errors'

include Errors

module InstallationFunctions
    private

    def get_vmpath(os_bits)
        vm_key = 'VB:Voicemeeter {17359A74-1236-5467}'
        reg_key =
            "Software#{os_bits == 64 ? "\\WOW6432Node" : ''}\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\"
        Win32::Registry::HKEY_LOCAL_MACHINE.open(reg_key + vm_key) do |reg|
            value = reg['UninstallString']

            pn = Pathname.new(value)
            return pn.dirname
        end
        raise InstallErrors.new('Could not get the Voicemeeter path')
    end

    def vm_dll=(value)
        unless value.file?
            raise InstallErrors.new('Could not fetch the dll file')
        end
        @vm_dll = value
    end
end
