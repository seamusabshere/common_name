# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'common_name/version'

Gem::Specification.new do |s|
  s.name        = "common_name"
  s.version     = CommonName::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Seamus Abshere', 'Derek Kastner']
  s.email       = ["seamus@abshere.net"]
  s.homepage    = 'http://github.com/seamusabshere/common_name'
  s.summary     = %q{Provides methods like User.common_name (#=> "user") and User.common_plural_symbol (#=> :users)}
  s.description = %q{Provides methods like User.common_name (#=> "user") and User.common_plural_symbol (#=> :users) so that you don't have to chain humanize/downcase/etc. etc.'}

  s.rubyforge_project = "commonname"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'shoulda'
  s.add_runtime_dependency 'activesupport', '>= 2.3.4'
end