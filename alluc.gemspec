# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alluc/version'

Gem::Specification.new do |spec|
  spec.name          = "alluc"
  spec.version       = Alluc::VERSION
  spec.authors       = ["Ahmet Abdi"]
  spec.email         = ["ahmetabdi@gmail.com"]

  spec.summary       = %q{'Alluc API'}
  spec.description   = %q{'ALluc API'}
  spec.homepage      = "https://github.com/ahmetabdi/alluc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'excon', '~> 0.44.4'
end
