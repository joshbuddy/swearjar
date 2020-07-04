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
  s.licenses = ['MIT']
  s.extra_rdoc_files = ['README.md']
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/joshbuddy/swearjar}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.test_files = `git ls-files`.split("\n").select{|f| f =~ /^spec/}

  # dependencies
  s.add_development_dependency 'rake',    '>= 12.3.3'
  s.add_development_dependency 'rspec',   '~> 3.9'
  s.add_development_dependency 'pry',   '~> 0.13'
end

