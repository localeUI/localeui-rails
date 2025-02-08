# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ProjectTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::Project.info
    test 'Localeui::Project.info should request for given project' do
      VCR.use_cassette 'test_project_info' do
        response = Localeui::Project.info
        assert response.successful?
        assert_equal('pro_0b4f5add7890f17a6da4', response.data['api_id'])
      end
    end

    # Test Localeui::Project.info without project_id
    test 'Localeui::Project.info should raise an error if project is not given' do
      Localeui.project_id = nil
      assert_raises NoProjectError do
        Localeui::Project.info
      end
    end
  end
end
