module Voicemeeter
  module Mixins
    module Fades
      def fadeto(target, time)
        self.setter("FadeTo", "(#{target}, #{time})")
        sleep(@remote.delay)
      end

      def fadeby(change, time)
        self.setter("FadeBy", "(#{change}, #{time})")
        sleep(@remote.delay)
      end
    end

    module Apps
      def appgain(name, gain)
        self.setter("AppGain", "(\"#{name}\", #{gain})")
      end

      def appmute(name, mute)
        self.setter("AppMute", "(\"#{name}\", #{mute ? 1 : 0})")
      end
    end

    module XY
      include Channel_Meta_Functions

      def initialize(remote, i)
        super
        self.make_accessor_float :pan_x,
                                 :pan_y,
                                 :color_x,
                                 :color_y,
                                 :fx_x,
                                 :fx_y
      end
    end

    module FX
      include Channel_Meta_Functions

      def initialize(remote, i)
        super
        self.make_accessor_float :reverb, :delay, :fx1, :fx2
        self.make_accessor_bool :postreverb, :postdelay, :postfx1, :postfx2
      end
    end
  end
end
