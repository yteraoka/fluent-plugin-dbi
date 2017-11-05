# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-dbi"
  gem.version       = "1.0.1"
  gem.licenses      = ['MIT']
  gem.authors       = ["TERAOKA Yoshinori"]
  gem.email         = ["yteraoka@me.com"]
  gem.description   = %q{fluentd output plugin using dbi. PostgreSQL and MySQL are tested}
  gem.summary       = %q{fluentd output plugin using dbi}
  gem.homepage      = "https://github.com/yteraoka/fluent-plugin-dbi"
  gem.has_rdoc      = false
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.rubyforge_project = "fluent-plugin-dbi"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "test-unit", ">= 3.1.0"
  gem.add_runtime_dependency "fluentd"
  gem.add_runtime_dependency "dbi"
end
