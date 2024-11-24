# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ConfigTest < ActiveSupport::TestCase
    test 'init all attributes' do
      FileUtils.rm_f("#{Rails.root}/#{Localeui::DEFAULT_CONFIG_FILE}")
      assert_equal('http://localhost:3000/api/v1/', Localeui::Config.setup.api_base)
    end

    test 'set api_base' do
      Localeui.config.api_base = 'wusa'
      assert_equal('wusa', Localeui.config.api_base)
    end

    test 'set access_token' do
      Localeui.config.access_token = 'wusa'
      assert_equal('wusa', Localeui.config.access_token)
    end

    test 'set client' do
      Localeui.config.client = 'wusa'
      assert_equal('wusa', Localeui.config.client)
    end

    test 'set uid' do
      Localeui.config.uid = 'wusa'
      assert_equal('wusa', Localeui.config.uid)
    end

    test 'set project_id' do
      Localeui.config.project_id = 'wusa'
      assert_equal('wusa', Localeui.config.project_id)
    end
  end
end
