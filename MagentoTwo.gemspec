# frozen_string_literal: true

require_relative "lib/MagentoTwo/version"

Gem::Specification.new do |spec|
  spec.name = "MagentoTwo"
  spec.version = MagentoTwo::VERSION
  spec.authors = ["Mohamad Kaakati"]
  spec.email = ["m@kaakati.me"]

  spec.summary = "Magento 2 API Wrapper"
  spec.description = "An API wrapper to handle orders, shipments, customers and products."
  spec.homepage = "https://github.com/Kaakati/magento-two"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Kaakati/magento-two"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.post_install_message = "#{spec.name} has been installed successfully!"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
