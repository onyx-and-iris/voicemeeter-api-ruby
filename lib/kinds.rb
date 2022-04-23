module Kinds
    """
    A Kind struct for each version of Voicemeeter
    """
    Kind = Struct.new(:properties, :layout)
    BASIC = Kind.new({
        :name => "basic", :exe => "voicemeeter.exe",
    },
    {
        :strip => {:p_in => 2, :v_in=> 1}, 
        :bus => {:p_out => 1, :v_out=> 1},
        :vban => {:instream => 4, :outstream => 4}, 
        :mb => 80,
    })

    BANANA = Kind.new({
        :name => "banana", :exe => "voicemeeterpro.exe",
    },
    {
        :strip => {:p_in => 3, :v_in=> 2},
        :bus => {:p_out => 3, :v_out=> 2},
        :vban => {:instream => 8, :outstream => 8},
        :mb => 80,
    })

    POTATO = Kind.new({
        :name => "potato",
    },
    {
        :strip => {:p_in => 5, :v_in=> 3},
        :bus => {:p_out => 5, :v_out=> 3},
        :vban => {:instream => 8, :outstream => 8},
        :mb => 80,
    })

    $kind_map = [BASIC, BANANA, POTATO].to_h do |kind|
        [kind.properties[:name], kind]
    end

    def get_kind(kind_id)
        return $kind_map[kind_id]
    end

    $kinds_all = $kind_map.values

    module_function :get_kind
end
