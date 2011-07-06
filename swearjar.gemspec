# -*- encoding: utf-8 -*-

require File.join(File.dirname(__FILE__), 'lib', 'swearjar', 'version')

Gem::Specification.new do |s|
  s.name = 'swearjar'
  s.version = Swearjar::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Hull"]
  s.summary = "Put another nickel in the swearjar. Simple profanity detection with content analysis"
  s.description = "#{s.summary}."
  s.email = %q{joshbuddy@gmail.com}
  s.extra_rdoc_files = ['README.rdoc']
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/joshbuddy/swearjar}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.test_files = `git ls-files`.split("\n").select{|f| f =~ /^spec/}
  s.rubyforge_project = 'swearjar'

  # dependencies
  s.add_runtime_dependency 'fuzzyhash',         '~> 0.0.11'
  s.add_development_dependency 'bundler', '~> 1.0.0'
  s.add_development_dependency 'rake',     '~> 0.8.7'
  s.add_development_dependency 'rspec',     '~> 1.3.0'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

