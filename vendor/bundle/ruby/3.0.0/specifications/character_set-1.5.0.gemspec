# -*- encoding: utf-8 -*-
# stub: character_set 1.5.0 ruby lib
# stub: ext/character_set/extconf.rb

Gem::Specification.new do |s|
  s.name = "character_set".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Janosch Mu\u0308ller".freeze]
  s.date = "2021-12-05"
  s.email = ["janosch84@gmail.com".freeze]
  s.extensions = ["ext/character_set/extconf.rb".freeze]
  s.files = ["ext/character_set/extconf.rb".freeze]
  s.homepage = "https://github.com/jaynetics/character_set".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Build, read, write and compare sets of Unicode codepoints.".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<benchmark-ips>.freeze, ["~> 2.7"])
    s.add_development_dependency(%q<get_process_mem>.freeze, ["~> 0.2.3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<range_compressor>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<regexp_parser>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<regexp_property_values>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8"])
    s.add_development_dependency(%q<codecov>.freeze, ["~> 0.2.12"])
    s.add_development_dependency(%q<gouteur>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.8"])
  else
    s.add_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
    s.add_dependency(%q<benchmark-ips>.freeze, ["~> 2.7"])
    s.add_dependency(%q<get_process_mem>.freeze, ["~> 0.2.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.1"])
    s.add_dependency(%q<range_compressor>.freeze, ["~> 1.0"])
    s.add_dependency(%q<regexp_parser>.freeze, ["~> 2.1"])
    s.add_dependency(%q<regexp_property_values>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.8"])
    s.add_dependency(%q<codecov>.freeze, ["~> 0.2.12"])
    s.add_dependency(%q<gouteur>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.8"])
  end
end
