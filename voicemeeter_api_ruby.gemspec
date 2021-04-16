# frozen_string_literal: true

lib = File.expand_path('./lib')

Gem::Specification.new do |spec|
    spec.name        = 'voicemeeter_api_ruby'
    spec.version     = '0.0.1'
    spec.summary     = 'Voicemeeter API wrapper'
    spec.description = 'A wrapper for Voicemeeter virtual mixer API in Ruby'
    spec.authors     = ["onyx_online"]
    spec.email       = 'code@onyxandiris.online'
    spec.files       = [*Dir.glob("{lib}/**")]
    spec.homepage    =
      'https://rubygems.org/gems/voicemeeter_api_ruby'
    spec.license       = 'NGPL'
    spec.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.10'
    spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
    spec.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  end