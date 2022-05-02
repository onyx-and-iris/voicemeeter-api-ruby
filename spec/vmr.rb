require 'voicemeeter'

ENV['RACK_ENV'] = 'dev'

module VMUnit
    attr_reader :testing

    @testing = Voicemeeter.testing
end
