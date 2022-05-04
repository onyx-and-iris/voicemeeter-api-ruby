require 'voicemeeter'

ENV['RACK_ENV'] = 'dev'

module VMUnit
    attr_reader :testing,
                :kind_name,
                :num_A,
                :num_B,
                :phys_in,
                :virt_in,
                :phys_out,
                :virt_out,
                :vban_in,
                :vban_out

    @testing = Voicemeeter.testing

    @kind_name = @testing.kind.name
    puts "Running #{@kind_name} tests"

    p_in, v_in = @testing.kind.layout[:strip].values
    p_out, v_out = @testing.kind.layout[:bus].values
    @vban_in, @vban_out = @testing.kind.layout[:vban].values.map { |i| i - 1 }

    @num_A = p_out
    @num_B = v_out
    @phys_in = p_in - 1
    @virt_in = p_in + v_in - 1
    @phys_out = p_out - 1
    @virt_out = p_out + v_out - 1
end
