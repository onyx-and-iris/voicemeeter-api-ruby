require_relative 'routines'


class Remote < Routines
    """
    Subclasses BaseRoutines.
    Performs login/logout cleanly.
    May yield a block argument otherwise simply login.
    """
    def initialize(type = nil)
        super
    end

    def connect
        login unless @logged_in

        if block_given?
            yield
            
            logout
        else
            return self
        end
    end
end
