# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tilt/loader_version'

Gem::Specification.new do |spec|
  spec.name          = 'tilt_loader'
  spec.version       = Tilt::LOADER_VERSION
  spec.authors       = ['Ryan Mark']
  spec.email         = ['ryan@mrk.cc']
  spec.summary       = 'Patterns and code for loading templates. Uses Tilt for rendering'
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = 'https://github.com/ryanmark/tilt_loader'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'tilt'
end
