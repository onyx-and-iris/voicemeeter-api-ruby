module Fades
    def fadeto(target, time)
        self.setter('FadeTo', "(#{target}, #{time})")
        sleep(@remote.DELAY)
    end

    def fadeby(change, time)
        self.setter('FadeBy', "(#{change}, #{time})")
        sleep(@remote.DELAY)
    end
end
