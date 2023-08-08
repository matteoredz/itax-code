# frozen_string_literal: true

require_relative "lib/itax_code/version"

Gem::Specification.new do |spec|
  spec.name = "itax_code"
  spec.version = ItaxCode::VERSION
  spec.licenses = ["MIT"]
  spec.authors = ["Matteo Rossi"]
  spec.email = ["mttrss5@gmail.com"]
  spec.summary = "Encode and decode Italian tax code (Codice Fiscale)"
  spec.homepage = "https://github.com/matteoredz/itax-code"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/matteoredz/itax-code"
  spec.metadata["changelog_uri"] = "https://github.com/matteoredz/itax-code/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "activesupport"
  spec.metadata["rubygems_mfa_required"] = "true"
end
