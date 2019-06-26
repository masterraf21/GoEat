lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "GoEat/version"

Gem::Specification.new do |spec|
  spec.name          = "GoEat"
  spec.version       = GoEat::VERSION
  spec.authors       = ["Rafi Abbel Mohammad"]
  spec.email         = ["masterraf21@gmail.com"]

  spec.summary       = %q{GoEat SEA COMPFEST Project.}
  spec.description   = %q{Simplified Go-Food app written in ruby.}
  spec.homepage      = "https://github.com/masterraf21/GoEat."
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/masterraf21/GoEat."
  spec.metadata["changelog_uri"] = "https://github.com/masterraf21/GoEat."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = ["GoEat"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'thor'
end
