# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter 'test/'
  add_filter '.github/'
  add_filter 'lib/generators/templates/'
  add_filter 'lib/lokalise_rails/version'
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative '../test/dummy/config/environment'
ENV['RAILS_ROOT'] ||= "#{File.dirname(__FILE__)}../../../test/dummy"

ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
require 'rails/test_help'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_paths=)
  ActiveSupport::TestCase.fixture_paths = [File.expand_path('fixtures', __dir__)]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths
  ActiveSupport::TestCase.file_fixture_path = "#{File.expand_path('fixtures', __dir__)}/files"
  ActiveSupport::TestCase.fixtures :all
end
