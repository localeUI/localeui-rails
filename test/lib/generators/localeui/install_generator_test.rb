# frozen_string_literal: true

require 'test_helper'
require 'generators/localeui/install_generator'

module Localeui
  module Generators
    class InstallGeneratorTest < ActiveSupport::TestCase
      ## Test Localeui::Generators::InstallGenerator
      test 'Localeui::Generators::InstallGenerator should create a config file' do
        remove_config_file
        Localeui::Generators::InstallGenerator.start
        assert File.file?(config_file)
      end
    end
  end
end
