# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PredicateLiteralKit4Ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "PredicateLiteralKit4Ruby"
  spec.version       = PredicateLiteralKit4Ruby::VERSION
  spec.authors       = ["Udo Schneider"]
  spec.email         = ["Udo.Schneider@homeaddress.de"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
