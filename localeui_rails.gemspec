# frozen_string_literal: true

require_relative 'lib/localeui_rails/version'

Gem::Specification.new do |spec|
  spec.name = 'localeui_rails'
  spec.version = LocaleuiRails::VERSION
  spec.authors = ['Lars Klindwordt']
  spec.email = ['lars.klindwordt@klind.de']

  spec.summary = 'LocaleUI Gem for Ruby on Rails applications'
  spec.description = 'This gem allows to integrate LocaleUI to your locale Ruby on Rails application'
  spec.homepage = 'https://localeui.com/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile lib/])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extra_rdoc_files = ['README.md']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency 'http', '~> 5.2'
  spec.add_dependency 'optparse', '~> 0.4'
  spec.add_dependency 'rake', '~> 13.0'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.66'
  spec.add_development_dependency 'rubocop-performance', '~> 1.21'
  spec.add_development_dependency 'rubocop-rspec', '~> 3.2'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
