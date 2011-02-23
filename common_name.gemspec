# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'common_name/version'

Gem::Specification.new do |s|
  s.name = %q{common_name}
  s.version = CommonName::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Seamus Abshere"]
  s.date = %q{2010-03-30}
  s.description = %q{Provides methods like User.common_name (#=> "user") and User.common_plural_symbol (#=> :users) so that you don't have to chain humanize/downcase/etc. etc.'}
  s.email = %q{seamus@abshere.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage = %q{http://github.com/seamusabshere/common_name}
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = %q{commonname}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{DRY up humanize/downcase/underscore/pluralize/to_sym/etc for names that we use all the time.}

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'shoulda'
  s.add_runtime_dependency 'activesupport', '>= 2.3.4'
end

