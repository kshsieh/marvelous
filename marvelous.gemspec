# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marvelous/version'

Gem::Specification.new do |spec|
  spec.add_dependency "faraday", "~> 0.9.0"
  spec.add_dependency "json", "~> 1.8.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.name          = "marvelous"
  spec.authors       = ["Kevin Hsieh"]
  spec.email         = ["kevinshsieh@gmail.com"]
  spec.description   = "Ruby wrapper for Marvel Comic's Developer API"
  spec.summary       = "Simple Ruby wrapper for Marvel Comic's Developer API"
  spec.homepage      = "https://www.github.com/kshsieh/marvelous"
  spec.license       = "MIT"
  spec.files += Dir.glob('lib/**/*.rb')
  spec.files += Dir.glob('spec/**/*')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version       = Marvelous::VERSION
end
