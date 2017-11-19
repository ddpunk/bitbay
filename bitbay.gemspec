# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbay/version'

Gem::Specification.new do |spec|
  spec.name          = "bitbay"
  spec.version       = Bitbay::VERSION
  spec.authors       = ["ddpunk"]
  spec.email         = ["ddpunk@gmail.com"]
  spec.summary       = %q{API Client for the Bitbay API v2}
  spec.description   = %q{API Client for the Bitbay API v2}
  spec.homepage      = "https://github.com/ddpunk/bitbay"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.9.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "figaro"
end
