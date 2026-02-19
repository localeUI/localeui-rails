# frozen_string_literal: true

require 'test_helper'

class LocaleuiTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert Localeui::VERSION
  end

  test 'check version' do
    assert_equal('0.1.1', Localeui::VERSION)
  end

  test 'provides config options' do
    Localeui.config do |config|
      assert_equal(Localeui, config)
    end
  end

  test 'set base_api' do
    Localeui.base_api = 'wusa'
    assert_equal('wusa', Localeui.base_api)
  end
end
