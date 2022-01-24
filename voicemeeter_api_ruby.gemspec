# frozen_string_literal: true
require File.expand_path('lib/version', __dir__)
lib = File.expand_path('./lib')

Gem::Specification.new do |spec|
    spec.name        = 'voicemeeter_api_ruby'
    spec.version     = Voicemeeter_API_Ruby::VERSION
    spec.summary     = 'Voicemeeter API wrapper'
    spec.description = 'A wrapper for Voicemeeter virtual mixer API in Ruby'
    spec.authors     = ["onyx_online"]
    spec.email       = 'code@onyxandiris.online'
    spec.files       = [*Dir.glob("{lib}/**")]
    spec.homepage    =
      'https://rubygems.org/gems/voicemeeter_api_ruby'
    spec.license       = 'NGPL'
    spec.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.10'
    spec.add_runtime_dependency 'toml', '~> 0.3.0'
    spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
    spec.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
    spec.required_ruby_version = '>= 2.7'
    spec.metadata = { "source_code_uri" => "https://github.com/onyx-and-iris/voicemeeter-api-ruby.git" }
end
