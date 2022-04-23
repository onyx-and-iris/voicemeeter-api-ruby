require 'toml'

module Profiles
    private

    def get_profiles(kind)
        filepath =
            File.join(File.dirname(__dir__), "/profiles/#{kind.name}/*.toml")

        Dir
            .glob(filepath)
            .to_h do |toml_file|
                filename = File.basename(toml_file, '.toml')
                puts "loading profile #{kind.name}/#{filename}"
                [filename, TOML::Parser.new(File.read(toml_file)).parsed]
            end
    end

    public

    def set_profile(value)
        unless @profiles.key? value
            raise VMRemoteErrors.new("No profile with name #{value} was loaded")
        end
        self.send('set_multi', @profiles[value])
        sleep(DELAY)
    end
end
