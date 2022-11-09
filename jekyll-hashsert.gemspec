# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-hashsert/version"
require "date"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-hashsert"
  spec.version       = Jekyll::Hashsert::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.0.0"  # Same as Jekyll
  spec.date          = DateTime.now.strftime("%Y-%m-%d")
  spec.authors       = ["Gourav Khunger"]
  spec.email         = ["gouravkhunger18@gmail.com"]
  spec.homepage      = "https://github.com/gouravkhunger/jekyll-hashsert"
  spec.license       = "MIT"

  spec.summary       = "Insert random hashes of custom length into strings"
  spec.description   = "A jekyll plugin that generates random alphanumeric hashes of custom length and inserts them into specific positions in an input string."

  spec.files          = Dir["*.gemspec", "Gemfile", "lib/**/*"]
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_runtime_dependency "jekyll", ">= 3.0.0"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.14"
end
