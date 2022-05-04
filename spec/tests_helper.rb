require_relative 'vmr'

include VMUnit

RSpec.configure do |config|
    'module setup'
    config.before(:suite) { VMUnit.testing.login }
    'module teardown'
    config.after(:suite) { VMUnit.testing.logout }

    'exclusion fixture'
    config.filter_run_excluding :if => false
end
