# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fixosm/version'

Gem::Specification.new do |spec|
  spec.name          = "fixosm"
  spec.version       = Fixosm::VERSION
  spec.authors       = ["Nicholas Kostelnik"]
  spec.email         = ["nkostelnik@gmail.com"]
  spec.summary       = %q{Fix up OpenStreetMap Generated data for libosmscout routing}
  spec.description   = %q{Sorts nodes, ways and relations into ascending order for libosmscout}
  spec.homepage      = "https://github.com/nkostelnik/fixosm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
