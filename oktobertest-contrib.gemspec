# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oktobertest/contrib/version'

Gem::Specification.new do |spec|
  spec.name          = 'oktobertest-contrib'
  spec.version       = Oktobertest::Contrib::VERSION
  spec.authors       = ['Patricio Mac Adden']
  spec.email         = ['patriciomacadden@gmail.com']
  spec.summary       = %q{Contributed Oktobertest extensions}
  spec.description   = %q{Contributed Oktobertest extensions}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'poltergeist'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'oktobertest'
end
