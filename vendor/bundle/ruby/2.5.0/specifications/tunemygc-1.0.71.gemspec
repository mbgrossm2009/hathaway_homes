# -*- encoding: utf-8 -*-
# stub: tunemygc 1.0.71 ruby lib
# stub: ext/tunemygc/extconf.rb

Gem::Specification.new do |s|
  s.name = "tunemygc".freeze
  s.version = "1.0.71"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bear Metal".freeze]
  s.date = "2018-02-22"
  s.description = "Agent for the GC tuning webservice https://www.tunemygc.com - optimal settings for throughput and memory usage of Ruby applications".freeze
  s.email = ["tunemygc@bearmetal.eu".freeze]
  s.executables = ["tunemygc".freeze]
  s.extensions = ["ext/tunemygc/extconf.rb".freeze]
  s.files = ["bin/tunemygc".freeze, "ext/tunemygc/extconf.rb".freeze]
  s.homepage = "https://tunemygc.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "TuneMyGC - optimal MRI Ruby 2.1+ Garbage Collection".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0.9.5", "~> 0.9"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 1.2.0", "~> 1.2"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<rake-compiler>.freeze, [">= 0.9.5", "~> 0.9"])
      s.add_dependency(%q<webmock>.freeze, [">= 1.2.0", "~> 1.2"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0.9.5", "~> 0.9"])
    s.add_dependency(%q<webmock>.freeze, [">= 1.2.0", "~> 1.2"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
  end
end
