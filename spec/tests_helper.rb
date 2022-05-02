require_relative 'vmr'

include VMUnit

RSpec.configure do |config|
    config.before(:suite) { VMUnit.testing.login }

    config.after(:suite) { VMUnit.testing.logout }
end
