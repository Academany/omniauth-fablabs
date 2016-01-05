# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-fablabs/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-fablabs"
  s.version     = OmniAuth::Fablabs::VERSION
  s.authors     = ["Fiore Basile"]
  s.email       = ["fiore.basile@gmail.com"]
  s.homepage    = "https://github.com/fibasile/omniauth-fablabs"
  s.description = %q{OmniAuth strategy for Fablabs.io}
  s.summary     = s.description
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth-oauth2', '~> 1.4'
  s.add_development_dependency 'bundler', '~> 1.0'
end
