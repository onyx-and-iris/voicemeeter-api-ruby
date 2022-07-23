require "voicemeeter/kinds"
require "toml"

module Voicemeeter
  module Configs
    private

    @@configs = Hash.new

    class TOMLStrBuilder
      def initialize(kind)
        @p_in, @v_in = kind[:layout][:strip].values
        @p_out, @v_out = kind[:layout][:bus].values
        @vs_params =
          ["mute = false", "mono = false", "solo = false", "gain = 0.0"] +
            (1..@p_out).map { |i| "A#{i} = false" } +
            (1..@v_out).map { |i| "B#{i} = false" }

        @ps_params = @vs_params + ["comp = 0.0", "gate = 0.0"]
        @bus_params = ["mono = false", "eq = false", "mute = false"]
      end

      def build
        "
        Builds a TOML script for the parser
        "
        @ps = (0...@p_in).map { |i| ["[strip_#{i}]"] + @ps_params }
        @ps.map! { |a| a.map { |s| s.gsub("B1 = false", "B1 = true") } }
        @vs =
          (@p_in...(@p_in + @v_in)).map { |i| ["[strip_#{i}]"] + @vs_params }
        @vs.map! { |a| a.map { |s| s.gsub("A1 = false", "A1 = true") } }

        @b = (0...(@p_out + @v_out)).map { |i| ["[bus_#{i}]"] + @bus_params }

        [@ps + @vs + @b].join("\n")
      end
    end

    def parser(data)
      TOML::Parser.new(data).parsed
    end

    def get_configs(kind_id)
      file_path = File.join(Dir.pwd, "configs", "#{kind_id}")

      if Dir.exist?(file_path)
        Dir
          .glob(File.join(file_path, "*.toml"))
          .to_h do |toml_file|
            filename = File.basename(toml_file, ".toml")
            puts "loading config #{kind_id}/#{filename} into memory"
            [filename, parser(File.read(toml_file))]
          end
      end
    end

    def loader
      if @@configs.empty?
        builder = TOMLStrBuilder.new(@kind)
        puts "loading config reset into memory"
        @@configs["reset"] = parser(builder.build)
        configs = get_configs(@kind.name.to_s)

        @@configs.merge!(configs) unless configs.nil?
      end
    end

    public

    def set_config(value)
      loader
      unless @@configs.key? value
        raise VMRemoteErrors.new("No profile with name #{value} was loaded")
      end

      self.send("set_multi", @@configs[value])
      puts "config #{@kind.name}/#{value} applied!"
      sleep(@delay)
    end

    alias_method "apply_config", :set_config
  end
end
