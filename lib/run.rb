require 'open3'
require_relative 'errors'
require_relative 'base'

module Run
    include Base

    def run_voicemeeter
        if VM_PATH.join(@properties[:exe]).executable?
            exe_path = String(VM_PATH.join(@properties[:exe]))
        else
            raise InstallErrors.new("Could not find Voicemeeter exe file")
        end

        Open3.popen3(exe_path, '')
    rescue InstallErrors => error
        raise error
    end
end
