require_relative 'routines'


class Remote < Routines
    """
    Subclasses BaseRoutines.
    Performs login/logout cleanly.
    May yield a block argument otherwise simply login.
    """
    def initialize(type = nil)
        super
        self.run
    end

    def run
        login

        if block_given?
            yield
            
            logout
        end
    end
end
