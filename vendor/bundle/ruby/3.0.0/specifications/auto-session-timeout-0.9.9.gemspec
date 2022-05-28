# -*- encoding: utf-8 -*-
# stub: auto-session-timeout 0.9.9 ruby lib

Gem::Specification.new do |s|
  s.name = "auto-session-timeout".freeze
  s.version = "0.9.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matthew Bass".freeze]
  s.date = "2022-01-10"
  s.description = "Automatic session timeout in Rails".freeze
  s.email = ["pelargir@gmail.com".freeze]
  s.homepage = "http://github.com/pelargir/auto-session-timeout".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Provides automatic session timeout in a Rails application.".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<actionpack>.freeze, [">= 3.2", "< 7.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 4.2", "< 6"])
  else
    s.add_dependency(%q<actionpack>.freeze, [">= 3.2", "< 7.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 4.2", "< 6"])
  end
end
