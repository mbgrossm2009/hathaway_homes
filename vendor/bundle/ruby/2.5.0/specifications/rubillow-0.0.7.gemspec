# -*- encoding: utf-8 -*-
# stub: rubillow 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "rubillow".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matthew Vince".freeze]
  s.date = "2013-06-16"
  s.description = "Ruby library to access the Zillow API".freeze
  s.email = ["rubillow@matthewvince.com".freeze]
  s.homepage = "https://github.com/synewaves/rubillow".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "rubillow".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Ruby library to access the Zillow API".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<bluecloth>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.6"])
    else
      s.add_dependency(%q<nokogiri>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<bluecloth>.freeze, ["~> 2.2"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.12"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<bluecloth>.freeze, ["~> 2.2"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.6"])
  end
end
