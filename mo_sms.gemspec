# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mo_sms/version'

Gem::Specification.new do |spec|
  spec.name          = "mo_sms"
  spec.version       = MoSms::VERSION
  spec.authors       = ["Jone Samra"]
  spec.email         = ["jonemob@gmail.com"]
  spec.summary       = %q{A Ruby wrapper class for the SMS sending service API called MO-SMS located in Sweden.}
  spec.description   = %q{A Ruby wrapper class for the SMS sending service API called MO-SMS located in Sweden.}
  spec.homepage      = "https://github.com/phenomen2277/mo_sms"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
