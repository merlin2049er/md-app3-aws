# -*- encoding: utf-8 -*-
# stub: js_regex 3.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "js_regex".freeze
  s.version = "3.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Janosch M\u00FCller".freeze]
  s.date = "2021-12-14"
  s.description = "JsRegex converts Ruby's native regular expressions for JavaScript, taking care of various incompatibilities and returning warnings for unsolvable differences.".freeze
  s.email = ["janosch84@gmail.com".freeze]
  s.homepage = "https://github.com/jaynetics/js_regex".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Converts Ruby regexes to JavaScript regexes.".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<character_set>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<regexp_parser>.freeze, ["~> 2.1"])
    s.add_runtime_dependency(%q<regexp_property_values>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<duktape>.freeze, ["~> 2.6"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.10"])
    s.add_development_dependency(%q<codecov>.freeze, ["~> 0.2.12"])
    s.add_development_dependency(%q<gouteur>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.8"])
  else
    s.add_dependency(%q<character_set>.freeze, ["~> 1.4"])
    s.add_dependency(%q<regexp_parser>.freeze, ["~> 2.1"])
    s.add_dependency(%q<regexp_property_values>.freeze, ["~> 1.0"])
    s.add_dependency(%q<duktape>.freeze, ["~> 2.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.10"])
    s.add_dependency(%q<codecov>.freeze, ["~> 0.2.12"])
    s.add_dependency(%q<gouteur>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.8"])
  end
end
