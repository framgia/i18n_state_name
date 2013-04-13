# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "i18n_state_name/version"

Gem::Specification.new do |s|
  s.name        = "i18n_state_name"
  s.version     = I18nStateName::VERSION
  s.authors     = ["Framgia Vietnam Co., Ltd"]
  s.email       = ["oss@framgia.com"]
  s.homepage    = "https://github.com/framgia/i18n_state_name"
  s.summary     = %q{add i18n name on state_machine}
  s.description = %q{add i18n name on state_machine}

  s.rubyforge_project = "i18n_state_name"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "state_machine", ">= 1.1.0"
end
