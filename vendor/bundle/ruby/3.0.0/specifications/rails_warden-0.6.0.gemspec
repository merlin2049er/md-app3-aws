# -*- encoding: utf-8 -*-
# stub: rails_warden 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_warden".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Neighman".freeze, "Justin Smestad".freeze, "Whitney Smestad".freeze]
  s.date = "2018-02-27"
  s.description = "A gem that provides authentication Rails helpers when using Warden for authentication".freeze
  s.email = "has.sox@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://github.com/hassox/rails_warden".freeze
  s.rubygems_version = "3.2.22".freeze
  s.summary = "A gem that provides authentication Rails helpers when using Warden for authentication".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<warden>.freeze, [">= 1.2.0"])
  else
    s.add_dependency(%q<warden>.freeze, [">= 1.2.0"])
  end
end
