# -*- encoding: utf-8 -*-
# stub: image_zoomer 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "image_zoomer".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Imran Latif".freeze]
  s.date = "2014-08-31"
  s.description = "This is a Rails gem for my image_zoomer jQuery plugin (https://github.com/ilatif/image_zoomer).".freeze
  s.email = ["ilatif.bwp@gmail.com".freeze]
  s.homepage = "https://github.com/ilatif/image_zoomer_rb".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "Thanks for installing image_zoomer gem.".freeze
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Image Zoomer".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
