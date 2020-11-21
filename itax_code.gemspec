require_relative 'lib/itax_code/version'

Gem::Specification.new do |spec|
  spec.name          = "itax_code"
  spec.version       = ItaxCode::VERSION
  spec.authors       = ["Matteo Rossi"]
  spec.email         = ["mttrss5@gmail.com"]

  spec.summary       = %q{A Ruby Gem to encode and decode Italian tax code (Codice Fiscale).}
  spec.homepage      = "https://github.com/matteoredz/itax-code"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matteoredz/itax-code"
  spec.metadata["changelog_uri"] = "https://github.com/matteoredz/itax-code/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "simplecov"
end
