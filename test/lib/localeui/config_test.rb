# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ConfigTest < ActiveSupport::TestCase
    test 'set base_api' do
      Localeui.base_api = 'wusa'
      assert_equal('wusa', Localeui.base_api)
    end

    test 'set api_token' do
      Localeui.api_token = '123.wusa'
      assert_equal('123.wusa', Localeui.api_token)
    end

    test 'set project_id' do
      Localeui.project_id = 'pro.xyz'
      assert_equal('pro.xyz', Localeui.project_id)
    end

    test 'set locales_path' do
      Localeui.locales_path = 'locales/path'
      assert_equal('locales/path', Localeui.locales_path)
    end

    test 'set allow_overwriting' do
      Localeui.allow_overwriting = true
      assert Localeui.allow_overwriting
    end
  end
end
