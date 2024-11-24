# frozen_string_literal: true

require 'test_helper'

class LocaleuiTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert Localeui::VERSION
  end

  test 'check version' do
    assert_equal('0.1.0', Localeui::VERSION)
  end
end
