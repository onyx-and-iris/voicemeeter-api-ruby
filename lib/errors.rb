module Errors
    class VMRemoteErrors < StandardError; end

    class InstallErrors < VMRemoteErrors; end

    class CAPIErrors < VMRemoteErrors
        attr_accessor :value, :func

        def initialize(value, func)
            self.value = value
            self.func = func
        end

        def message
            "C API returned value #{value}. See documentation for further info"
        end
    end

    class OutOfBoundsErrors < VMRemoteErrors
        attr_accessor :range

        def initialize(range)
            self.range = range
        end

        def message
            if @range.kind_of?(Array)
                "Value out of range, expected one of #{@range}"
            else
                "Value out of range, expected #{@range}"
            end
        end
    end
end