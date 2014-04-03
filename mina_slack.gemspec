$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mina_slack/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mina_slack"
  s.version     = MinaSlack::VERSION
  s.authors     = ["Mike Bajur"]
  s.email       = ["mbajur@gmail.com"]
  s.homepage    = "https://github.com/mbajur/mina_slack"
  s.summary     = "Mina bindings for Slack"
  s.description = "Adds tasks to aid in the Slack notifications."

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "mina"
end
