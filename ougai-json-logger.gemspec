$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "ougai_json/logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "ougai-json-logger"
  spec.version     = OugaiJson::Logger::VERSION
  spec.authors     = ["Jack.Wu"]
  spec.email       = ["jwu4000@outlook.com", "xuwupeng2000@gmail.com"]
  spec.homepage    = "https://github.com/xuwupeng2000/json-logger"
  spec.summary     = "A Ougai based json looger for Rails, it is based on lograge and ougai, and it is a rails engine"
  spec.description = "A Ougai json looger for Rails, it is based on lograge and ougai, and it is a rails engine, it works out of the box, just add it as gem is enough"
  spec.license     = "MIT"

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'lograge'
  spec.add_dependency 'mono_logger', '~> 1.0'
  spec.add_dependency 'ougai'
  spec.add_dependency 'ougai-formatters-customizable', '1.0.0'
  spec.add_dependency 'rails', '>= 5'
end
