require_relative 'base'

module Define_Version
    include Base

    def define_version(type)
        if type == "basic"
            self.properties = {
                :name => type,
                :exe => "voicemeeter.exe"
            }
            self.layout = {
                :strip => {:p_in => 2, :v_in=> 1},
                :bus => {:p_out => 1, :v_out=> 1},
                :vban => {:instream => 4, :outstream => 4},
            }
        elsif type == "banana"
            self.properties = {
                :name => type,
                :exe => "voicemeeterpro.exe"
            }
            self.layout = {
                :strip => {:p_in => 3, :v_in=> 2},
                :bus => {:p_out => 3, :v_out=> 2},
                :vban => {:instream => 8, :outstream => 8},
            }
        elsif type == "potato"
            self.properties = {
                :name => type,
                :exe => "voicemeeter8#{OS_BITS == 64 ? "x64" : ""}.exe"
            }
            self.layout = {
                :strip => {:p_in => 5, :v_in=> 3},
                :bus => {:p_out => 5, :v_out=> 3},
                :vban => {:instream => 8, :outstream => 8},
            }
        end
    end
end
