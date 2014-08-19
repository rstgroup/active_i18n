$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_i18n/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_i18n"
  s.version     = ActiveI18n::VERSION
  s.authors     = ["Wojciech Krysiak"]
  s.email       = ["w@rst-it.com"]
  s.homepage    = "https://github.com/rstgroup/active_i18n"
  s.summary     = "Plugin for active admin which allows to easy modify I18n translations"
  s.description = "Plugin for active admin which allows to easy modify I18n translations"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "activeadmin", "~> 0.6.3"
  s.add_dependency "haml-rails"
  s.add_dependency "redis"
  s.add_development_dependency 'jquery-ui-rails', "~> 4.1.1"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "coffee-rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "active_skin"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "pry-rails"
end
