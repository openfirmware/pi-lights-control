# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pi-lights-control/version'

Gem::Specification.new do |spec|
  spec.name          = "pi-lights-control"
  spec.version       = Pi::Lights::Control::VERSION
  spec.authors       = ["James Badger"]
  spec.email         = ["james@jamesbadger.ca"]

  spec.summary       = %q{Control one model of xmas lights via Raspberry Pi}
  spec.description   = %q{Control a specific model of Christmas lights using a Raspberry Pi and a 433.920 MHz transmitter connected via GPIO.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
