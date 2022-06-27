require 'kinds'
require 'toml'

module Configs
    private

    @@configs = Hash.new

    class TOMLStrBuilder
        def initialize(kind)
            @p_in, @v_in = kind[:layout][:strip].values
            @p_out, @v_out = kind[:layout][:bus].values
            @virt_strip_params =
                ['mute = false', 'mono = false', 'solo = false', 'gain = 0.0'] +
                    (1..@p_out).map { |i| "A#{i} = false" } +
                    (1..@v_out).map { |i| "B#{i} = false" }

            @phys_strip_params =
                @virt_strip_params + ['comp = 0.0', 'gate = 0.0']
            @bus_params = ['mono = false', 'eq = false', 'mute = false']
        end

        def build
            '
            Builds a TOML script for the parser
            '
            @ps = (0...@p_in).map { |i| ["[strip_#{i}]"] + @phys_strip_params }
            @ps.map! { |a| a.map { |s| s.gsub('B1 = false', 'B1 = true') } }
            @vs =
                (@p_in...(@p_in + @v_in)).map do |i|
                    ["[strip_#{i}]"] + @virt_strip_params
                end
            @vs.map! { |a| a.map { |s| s.gsub('A1 = false', 'A1 = true') } }

            @b =
                (0...(@p_out + @v_out)).map { |i| ["[bus_#{i}]"] + @bus_params }

            [@ps + @vs + @b].join("\n")
        end
    end

    def parser(data)
        TOML::Parser.new(data).parsed
    end

    def get_configs(kind_id)
        file_pattern =
            File.join(File.dirname(__dir__), 'configs', "#{kind_id}", '*.toml')

        Dir
            .glob(file_pattern)
            .to_h do |toml_file|
                filename = File.basename(toml_file, '.toml')
                puts "loading config #{kind_id}/#{filename} into memory"
                [filename, parser(File.read(toml_file))]
            end
    end

    def loader
        if @@configs.empty?
            builder = TOMLStrBuilder.new(@kind)
            puts 'loading config reset into memory'
            @@configs['reset'] = parser(builder.build)
            @@configs.merge!(get_configs(@kind.name.to_s))
        end
    end

    public

    def set_config(value)
        loader
        unless @@configs.key? value
            raise VMRemoteErrors.new("No profile with name #{value} was loaded")
        end

        self.send('set_multi', @@configs[value])
        puts "config #{@kind.name}/#{value} applied!"
        sleep(@delay)
    end
end
