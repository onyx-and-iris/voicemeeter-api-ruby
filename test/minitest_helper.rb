require 'minitest/autorun'
require 'voicemeeter'

class MiniTest::Test
    @@vmr = Remote.new("banana")

    def setup
    end

    def teardown
    end

    MiniTest.after_run do
        @@vmr.logout
    end
end