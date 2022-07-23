require_relative "vmr"

include VMUnit

RSpec.configure do |config|
  "module setup"
  config.before(:suite) do
    VMUnit.testing.login
    VMUnit.testing.command.reset
  end
  "module teardown"
  config.after(:suite) { VMUnit.testing.logout }

  "exclusion fixture"
  config.filter_run_excluding if: false
end
