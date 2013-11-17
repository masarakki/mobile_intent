# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobile_intent/version'

Gem::Specification.new do |spec|
  spec.name          = "mobile_intent"
  spec.version       = MobileIntent::VERSION
  spec.authors       = ["masarakki"]
  spec.email         = ["masaki@hisme.net"]
  spec.description   = %q{start application via custom scheme}
  spec.summary       = %q{start application via custom scheme}
  spec.homepage      = "https://github.com/masarakki/mobile_intent"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.0", "< 5.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
end
