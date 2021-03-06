# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'notify/version'

Gem::Specification.new do |spec|
  spec.name          = "notify"
  spec.version       = Notify::VERSION
  spec.authors       = ["Dmitry Halai"]
  spec.email         = ["dmitry.halai@gmail.com"]
  spec.summary       = "Tracking for ActiveRecord models"
  spec.description   = "Create channels when model change (updating some attributes, create instance etc.)"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3', '~> 1.3.7'
end
