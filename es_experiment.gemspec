lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "es_experiment/version"

Gem::Specification.new do |spec|
  spec.name          = "es_experiment"
  spec.version       = EsExperiment::VERSION
  spec.authors       = ["Caio Penhalver"]
  spec.email         = ["caio.penhalver@gmail.com"]

  spec.summary       = %q{Library that helps create and index documents in Elasticsearch}
  spec.description   = %q{Library that helps create and index documents in Elasticsearch}
  spec.homepage      = "https://github.com/VAGAScom"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = "https://github.com/VAGAScom"
  spec.metadata["source_code_uri"] = "https://github.com/VAGAScom"
  spec.metadata["changelog_uri"] = "https://github.com/VAGAScom"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "elasticsearch"
end
