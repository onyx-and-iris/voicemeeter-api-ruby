module Voicemeeter
  module Version
    module_function

    def major
      4
    end

    def minor
      3
    end

    def patch
      0
    end

    def to_a
      [major, minor, patch]
    end

    def to_s
      to_a.join(".")
    end
  end
end
