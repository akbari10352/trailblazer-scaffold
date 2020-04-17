require './lib/trailblazer_scaffold/version.rb'

Gem::Specification.new do |s|
  s.name = %q{trailblazer_scaffold}
  s.version = TrailblazerScaffold::Version::VERSION
  s.date = %q{2020-04-15}
  s.summary = %q{generate operations and contracts based on model and actions}
  s.description = %q{To create files run 'rails g trailblazer_scaffold:generate ClassName', if you have parent classes, type the whole path. for example for 'models/shop/product.rb' run "rails g trailblazer_scaffold:generate Shop::Product" }
  s.files = [
    'lib/trailblazer_scaffold/contract/generate.rb',
    'lib/trailblazer_scaffold/operation/generate.rb',
    'lib/trailblazer_scaffold/get_actions.rb',
    'lib/trailblazer_scaffold.rb',
    'lib/generators/trailblazer_scaffold/generate_generator.rb'
  ]
  s.metadata = {
    'documentation_uri' => 'https://github.com/akbari10352/trailblazer-scaffold',
    'homepage_uri'      => 'https://github.com/akbari10352/trailblazer-scaffold',
    'source_code_uri'   => 'https://github.com/akbari10352/trailblazer-scaffold'
  }
  s.homepage = 'https://gitlab.com/mehrnoush10352/trailblazer_scaffold'
  s.license = 'MIT'
  s.authors = ['Mehrnoush Akbari']
  s.require_paths = ['lib']
  s.add_runtime_dependency 'trailblazer', '~> 2.0', '>= 2.0.7'
  s.add_runtime_dependency 'trailblazer-rails', '~> 2.1', '>= 2.1.7'
  s.required_ruby_version = '>= 2.1.0'
end
