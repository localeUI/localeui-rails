# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ProjectTest < ActiveSupport::TestCase
    ### Test Localeui::Project.info
    test 'Localeui::Project.info should raise an error, if no project is set up' do
      assert_raises Localeui::NoProjectError do
        Localeui::Project.info
      end
    end
  end
end
