# -*- encoding: utf-8 -*-

require File.expand_path('../lib/elhub/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "elhub"
  gem.version       = Elhub::VERSION
  gem.summary       = %q{handly el-hub reporting tool}
  gem.description   = %q{handly el-hub reporting tool}
  gem.license       = "MIT"
  gem.authors       = ["dariusz gorzeba"]
  gem.email         = "dariusz.gorzeba@elpassion.pl"
  gem.homepage      = "https://github.com/godot/elhub#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
