# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marvelous/version'

Gem::Specification.new do |spec|
  spec.name          = "marvelous"
  spec.version       = Marvelous::VERSION
  spec.authors       = ["Kevin Hsieh"]
  spec.email         = ["kevinshsieh@gmail.com"]
  spec.description   = "Ruby wrapper for Marvel Comic's Developer API"
  spec.summary       = "simple and elegant ruby interface for Marvel Comic's Developer API"
  spec.homepage      = "https://www.github.com/kshsieh/marvelous"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
