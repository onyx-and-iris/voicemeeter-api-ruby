require 'voicemeeter'

RSpec.configure do |config|
    config.before(:suite) do
        @vmr = Voicemeeter::testing
        @vmr.login
    end

    config.before(:all) { @vmr = Voicemeeter::testing }

    config.after(:suite) do
        @vmr = Voicemeeter::testing
        @vmr.logout
    end
end
