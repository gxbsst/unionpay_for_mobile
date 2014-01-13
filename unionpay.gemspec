# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unionpay/version'

Gem::Specification.new do |spec|
  spec.name          = "unionpay"
  spec.version       = Unionpay::VERSION
  spec.authors       = ["Weston Wei"]
  spec.email         = ["weixuhong@rongyi.com"]
  spec.description   = %q{union pay}
  spec.summary       = %q{union pay}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "spork"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "webmock"
  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "curb"
  spec.add_runtime_dependency "pry"
end
