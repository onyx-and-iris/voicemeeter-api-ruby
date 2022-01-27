require_relative 'errors'

class FalseClass; def to_i; 0 end end
class TrueClass; def to_i; 1 end end

module Meta_Functions
    private
    def make_accessor_bool(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return !(self.getter("#{param}")).zero?
            end

            opts = [false, true, 0, 1]
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts) unless opts.include? value
                self.setter("#{param}", value.to_i == 1 ? 1 : 0)
            end
        end
    end

    def make_accessor_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}").to_i
            end
            define_singleton_method("#{param}=") do |value|
                self.setter("#{param}", value)
            end
        end
    end

    def make_accessor_float(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}")
            end
            define_singleton_method("#{param}=") do |value|
                self.setter("#{param}", value)
            end
        end
    end

    def make_accessor_string(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}", true)
            end
            define_singleton_method("#{param}=") do |value|
                self.setter("#{param}", value)
            end
        end
    end

    def make_reader_only(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}")
            end
        end
    end

    def make_writer_only(*params)
        params.each do |param|
            define_singleton_method("#{param}=") do |value=1|
                self.setter("#{param}", value)
            end
        end
    end

    def make_channel_props(num_A, num_B)
        (1..(num_A + num_B)).map do |i|
            i <= num_A ? "A#{i}" : "B#{i - num_A}"
        end
    end
end


module Channel_Meta_Functions
    include Meta_Functions

    def make_accessor_bool(*params)
        params.each do |param|
            cmds = {
                :eq => 'EQ.on',
            }
            if cmds[param] then val = cmds[param] else val = param end

            define_singleton_method("#{param}") do
                return !(self.getter("#{val}")).zero?
            end

            opts = [false, true, 0, 1]
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts) unless opts.include? value
                self.setter("#{val}", value.to_i == 1 ? 1 : 0)
            end
        end
    end

    def make_accessor_float(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}")
            end

            opts = {
                :gain => [-60,12],
                :comp => [0,10],
                :gate => [0,10],
            }
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts[param]) unless value.between? *opts[param]
                self.setter("#{param}", value)
            end
        end
    end

    def make_accessor_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return self.getter("#{param}").to_i
            end

            opts = {
                :limit => (-40..12),
                :k => (0..4),
            }
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts[param]) unless opts[param].member? value
                self.setter("#{param}", value)
            end
        end
    end

    def make_reader_only(*params)
        params.each do |param|
            cmds = {
                :device => 'device.name',
                :sr => 'device.sr',
            }
            if cmds[param] then val = cmds[param] else val = param end

            define_singleton_method("#{param}") do
                case param
                when :device
                    return self.getter("#{val}", true)
                when :sr
                    return self.getter("#{val}", true).to_i
                end
            end
        end
    end
end


module Vban_Meta_Functions
    include Meta_Functions

    def make_reader_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                case param
                when :bit
                    return self.getter("#{param}").to_i == 1 ? 16 : 24
                else
                    return self.getter("#{param}").to_i
                end
            end
        end
    end

    def make_accessor_int(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                case param
                when :bit
                    return self.getter("#{param}").to_i == 1 ? 16 : 24
                else
                    return self.getter("#{param}").to_i
                end
            end

            opts = {
                :sr => [11025, 16000, 22050, 24000, 32000, 44100, 48000,
                64000, 88200, 96000],
                :channel => (1..8),
                :bit => [16,24],
                :quality => (0..4),
                :route => (0..8),
            }

            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts[param]) unless opts[param].member? value
                case param
                when :bit
                    self.setter("#{param}", value == 16 ? 1 : 2)
                else
                    self.setter("#{param}", value)
                end
            end
        end
    end
end


module MacroButton_Meta_Functions
    def make_accessor_macrobutton(*params)
        params.each do |param|
            mode = {
                :state => 1,
                :stateonly => 2,
                :trigger => 3,
            }

            define_singleton_method("#{param}") do
                return !(self.getter(mode[param])).zero?
            end

            opts = [false, true, 0, 1]
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts[param]) unless opts.include? value
                self.setter(value.to_i == 1 ? 1 : 0, mode[param])
            end
        end
    end
end

module Commands_Meta_Functions
    include Meta_Functions
    def make_action_prop(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                self.setter("#{param}", 1)
            end
        end
    end

    def make_writer_bool(*params)
        params.each do |param|
            cmds = {
                :showvbanchat => 'DialogShow.VBANCHAT',
            }
            if cmds[param] then val = cmds[param] else val = param end

            opts = [false, true]
            define_singleton_method("#{param}=") do |value|
                raise OutOfBoundsErrors.new(opts) unless opts.include? value
                self.setter("#{param}", value.to_i == 1 ? 1 : 0)
            end
        end
    end
end
