module Layout
    def define_layout(type)
        if type == "basic"
            self.layout = {
                :strip => {:p_in => 2, :v_in=> 1},
                :bus => {:p_out => 1, :v_out=> 1},
                :vban => {:instream => 4, :outstream => 4},
            }
        elsif type == "banana"
            self.layout = {
                :strip => {:p_in => 3, :v_in=> 2},
                :bus => {:p_out => 3, :v_out=> 2},
                :vban => {:instream => 8, :outstream => 8},
            }
        elsif type == "potato"
            self.layout = {
                :strip => {:p_in => 5, :v_in=> 3},
                :bus => {:p_out => 5, :v_out=> 3},
                :vban => {:instream => 8, :outstream => 8},
            }
        end
    end
end