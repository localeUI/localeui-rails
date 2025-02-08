# frozen_string_literal: true

require 'simplecov'
require 'webmock/minitest'
require 'vcr'

SimpleCov.start 'rails' do
  add_filter 'test/'
  add_filter '.github/'
  add_filter 'lib/generators/templates/'
  add_filter 'lib/lokalise/version'
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = {
    record: :new_episodes
  }
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

FileUtils.touch "#{Rails.root}/config/initializers/localeui.rb"
Rails.application.load_tasks

module ActiveSupport
  class TestCase
    setup do
      remove_config_file
    end

    teardown do
      remove_config_file
    end

    def remove_config_file
      FileUtils.rm_f(config_file)
    end

    def config_file
      "#{Rails.root}/config/initializers/localeui.rb"
    end
  end
end
