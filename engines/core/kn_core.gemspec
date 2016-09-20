$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kn/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kn_core"
  s.version     = Kn::Core::VERSION
  s.authors     = ["John Doe"]
  s.summary     = "Core features."
  s.description = "Core features."

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"

  s.add_dependency "swagger-blocks"
  s.add_dependency "devise_token_auth"
  # ActiveModel::Serializer implementation and Rails hooks, https://github.com/rails-api/active_model_serializers
  s.add_dependency "active_model_serializers", "~> 0.10.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "fuubar"
end
