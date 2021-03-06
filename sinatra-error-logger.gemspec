# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/error_logger'

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-error-logger'
  spec.version       = Sinatra::ErrorLogger::VERSION
  spec.authors       = ['Tomas Brazys', 'Tomas Varaneckas']
  spec.email         = ['tomas.brazys@gmail.com', 'tomas.varaneckas@gmail.com']
  spec.summary       = 'Sinatra error logging middleware'
  spec.description   = 'Sinatra error logging middleware'
  spec.homepage      = 'http://github.com/vinted/sinatra-error-logger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
end
