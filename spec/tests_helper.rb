require 'voicemeeter'

RSpec.configure do |config|
    config.before(:suite) do
        @vmr = Voicemeeter::testing
        @vmr.login
    end

    config.before(:all) do
        @vmr = Voicemeeter::testing
    end 

    config.after(:suite) do
        @vmr.logout
    end 
end
