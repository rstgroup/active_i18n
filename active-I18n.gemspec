# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active/I18n/version'

Gem::Specification.new do |spec|
  spec.name          = "active-I18n"
  spec.version       = Active::I18n::VERSION
  spec.authors       = ["Wojtek Krysiak"]
  spec.email         = ["wojciech.krysiak@kmpgroup.pl"]
  spec.summary       = %q{I18n translation panel for activeadmin}
  spec.description   = %q{I18n translation panel for activeadmin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
