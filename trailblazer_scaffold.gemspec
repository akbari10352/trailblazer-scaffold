require './lib/version.rb'

Gem::Specification.new do |s|
  s.name = %q{trailblazer_scaffold}
  s.version = TrailblazerScaffold::Version::VERSION
  s.date = %q{2020-04-15}
  s.summary = %q{generate operation and contracts based on model and routes}
  s.files = [
    'lib/contract/generate.rb',
    'lib/operation/generate.rb',
    'lib/get_actions.rb',
    'lib/trailblazer_scaffold.rb'
  ]
  s.metadata = {
    'documentation_uri' => 'https://gitlab.com/mehrnoush10352/trailblazer_scaffold',
    'homepage_uri'      => 'https://gitlab.com/mehrnoush10352/trailblazer_scaffold',
    'source_code_uri'   => 'https://gitlab.com/mehrnoush10352/trailblazer_scaffold'
  }
  s.homepage = 'https://gitlab.com/mehrnoush10352/trailblazer_scaffold'
  s.license = 'MIT'
  s.authors = ['Mehrnoush Akbari']
  s.require_paths = ['lib']
  s.add_runtime_dependency 'trailblazer', '~> 2.0', '>= 2.0.7'
  s.add_runtime_dependency 'trailblazer-rails', '~> 2.1', '>= 2.1.7'
  s.required_ruby_version = '>= 2.1.0'
end