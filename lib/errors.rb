module Errors
    class VMRemoteErrors < StandardError; end

    class InstallErrors < VMRemoteErrors; end
end