module Utils
    attr_reader :m1, :m2, :m3

    def m1=(value)
        @m1 = value.downcase
    end

    def m2=(value)
        if value.to_i.to_s == value
            @m2 = value.to_i
        else
            @m2 = value
        end
    end

    def m3=(value)
        if value.to_i.to_s == value
            @m3 = value
        else
            @m3 = value
        end
    end

    def test_regex(regex, param)
        regex.match(param) do |m|
            self.m1 = m[1]
            self.m2 = m[2]
            self.m3 = m[3]
            matches = 0
            (1..m.size).each { |num| matches += 1 if m[num] }
            return matches
        end
    end

    def shiftdn(oldnum)
        oldnum.to_i - 1
    end

    def shiftup(oldnum)
        oldnum.to_i + 1
    end

    def bool_to_float(value)
        (value ? 1 : 0).to_f
    end

    def bool_to_int(value)
        (value ? 1 : 0)
    end

    def type_return(param, value)
        return value.to_i if @is_bool.include? param
        return value.round(1) if @is_float.include? param
        value
    end

    def validate(name, num)
        """
        Validate boundaries unless param requires none
        """
        if name == "strip"
            return num < @strip_total
        elsif name == "bus"
            return num < @bus_total
        elsif name == "mb"
            return num.between?(0, 69)
        elsif ["vban", "instream", "outstream"].include? name
            return num < @vban_total
        elsif name == "composite"
            return num < @composite_total
        elsif name == "insert"
            return (num < @insert_total) if @type == POTATO
            raise VersionError
        elsif name == "reverb" || name == "delay"
            return @type == POTATO
            raise VersionError
        elsif @is_bool.include? name
            return [0,1].include? num
        elsif name == "gain"
            return num.between?(-60, 12)
        elsif name == "comp" || name == "gate"
            return num.between?(0, 10)
        elsif name == "limit"
            return num.between?(-40, 12)
        elsif @vban_ranges.has_key? name
            return num.between?(*@vban_ranges[name])
        end
        true
    end
end
