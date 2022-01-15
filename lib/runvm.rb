require 'open3'
require_relative 'errors'
require_relative 'base'

module RunVM
    include Base

    def run_voicemeeter
        if VM_PATH.join(@properties[:exe]).executable?
            exe_path = String(VM_PATH.join(@properties[:exe]))
        else
            raise InstallErrors.new("Could not find Voicemeeter exe file")
        end

        Open3.popen3(exe_path, '')
        sleep(1)

        clear_polling
    end
end
