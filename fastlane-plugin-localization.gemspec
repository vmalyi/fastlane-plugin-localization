# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/localization/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-localization'
  spec.version       = Fastlane::Localization::VERSION
  spec.author        = %q{Viktor Malyi}
  spec.email         = %q{viktor.malyi@gmail.com}

  spec.summary       = %q{Export/import app localizations with help of xcodebuild -exportLocalizations/-importLocalizations tool}
  # spec.homepage      = "https://github.com/malyi/fastlane-plugin-localization"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.95.0'
end
