# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in localeui_rails.gemspec
gemspec

gem 'puma'
gem 'sqlite3'

group :development do
  gem 'codecov', '~> 0.6'
  gem 'dotenv', '~> 3.1'
  gem 'rails', '~> 7.1.3'

  # rubocop dependencies...
  gem 'rubocop', '~> 1.66'
  gem 'rubocop-performance', '~> 1.21'
  gem 'rubocop-rspec', '~> 3.2'

  gem 'simplecov', '>= 0.15', '< 0.22'
  gem 'vcr', '~> 6.3'
  gem 'webmock', '~> 3.24'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end
