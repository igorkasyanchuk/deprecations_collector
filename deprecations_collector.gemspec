$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deprecations_collector/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deprecations_collector"
  s.version     = DeprecationsCollector::VERSION
  s.authors     = ["Igor Kasyanchuk"]
  s.email       = ["igorkasyanchuk@gmail.com"]
  s.homepage    = "https://github.com/igorkasyanchuk/deprecations_collector"
  s.summary     = "Log your deprecations in log file."
  s.description = "Log your deprecations in log file."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3", '~> 1.3.5'
end
