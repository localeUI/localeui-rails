# frozen_string_literal: true

require 'test_helper'
require 'generators/localeui/install_generator'

module Localeui
  module Generators
    class InstallGeneratorTest < ActiveSupport::TestCase
      ## Test Localeui::Generators::InstallGenerator
      test 'Localeui::Generators::InstallGenerator should create a config file' do
        Localeui::Generators::InstallGenerator.start
        assert File.file?("#{Rails.root}/config/localeui.rb")
      end
    end
  end
end
