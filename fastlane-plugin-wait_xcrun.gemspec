# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/wait_xcrun/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-wait_xcrun'
  spec.version       = Fastlane::WaitXcrun::VERSION
  spec.author        = 'Maksym Grebenets'
  spec.email         = 'mgrebenets@gmail.com'

  spec.summary       = 'Wait for Xcode toolchain to come back online after switching Xcode versions.'
  spec.homepage      = "https://github.com/mgrebenets/fastlane-plugin-wait_xcrun"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w[README.md LICENSE]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'fastlane', '>= 1.104.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
