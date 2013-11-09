# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PredicateLiteralKit4Ruby/version'

Gem::Specification.new do |spec|
  spec.name = "PredicateLiteralKit4Ruby"
  spec.version = PredicateLiteralKit4Ruby::VERSION
  spec.authors = ["Udo Schneider"]
  spec.email = ["Udo.Schneider@homeaddress.de"]
  spec.description = %q{Parse Cappuccino Literal predicated and sort descriptors to arel expressions}
  spec.summary = %q{Parse Cappuccino Literal predicated and sort descriptors to arel expressions}
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"

  spec.add_dependency "arel"
  spec.add_dependency "json"
  spec.add_dependency "msgpack"
end
