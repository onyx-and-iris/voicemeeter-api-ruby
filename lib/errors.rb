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
            "When attempting to run function #{@func} the
            C API returned value #{@value}. See documentation for further info"
        end
    end

    class OutOfBoundsErrors < VMRemoteErrors
        attr_accessor :range

        def initialize(range)
            self.range = range
        end

        def message
            if @range.kind_of?(Range)
                "Value error, expected value in range (#{range.first}..#{range.last})"
            elsif @range.kind_of?(Array)
                "Value error, expected one of: #{@range}"
            else
                "Value error, expected #{@range}"
            end
        end
    end
end
