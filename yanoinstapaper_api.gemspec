# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yanoinstapaper_api/version"

Gem::Specification.new do |s|
  s.name        = "yanoinstapaper_api"
  s.version     = YanoInstapaper::VERSION
  s.authors     = ["Jason Yanowitz"]
  s.email       = ["yanoinstapaper_api@me.jasonyanowitz.com"]
  s.homepage    = "https://github.com/yanowitz/yanoinstapaper_api"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "yanoinstapaper_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
