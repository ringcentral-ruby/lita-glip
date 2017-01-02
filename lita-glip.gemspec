Gem::Specification.new do |spec|
  spec.name          = 'lita-glip'
  spec.date          = '2017-01-01'
  spec.version       = '0.0.1'
  spec.authors       = ['John Wang']
  spec.email         = ["johncwang@gmail.com"]
  spec.description   = %q{A Glip adapter for Lita.}
  spec.summary       = %q{A Glip adapter for the Lita chat robot.}
  spec.homepage      = 'https://github.com/ringcentral-ruby/lita-glip'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'adapter' }

  #spec.files         = `git ls-files`.split($/)
  spec.files         = Dir['lib/**/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4', '>= 4.4.3'
  spec.add_runtime_dependency 'glip_sdk', '~> 0', '>= 0.0.3'
  spec.add_runtime_dependency 'multi_json', '~> 1', '>= 1.12.1'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug', '~> 3', '>= 3.4.2'
  spec.add_development_dependency 'rack-test', '~> 0', '>= 0.6.3'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3', '>= 3.0.0'
  spec.add_development_dependency 'simplecov', '~> 0', '>= 0.9.2'
  spec.add_development_dependency 'coveralls', '~> 0'
end
