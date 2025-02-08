# frozen_string_literal: true

require 'test_helper'

module Localeui
  class EventTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::Event.create
    test 'Localeui::Event.create should create an event for given project and user' do
      VCR.use_cassette 'test_event_create_with_all_needed_configs' do
        response = Localeui::Event.create
        assert response.successful?
        assert_equal('evt_0c5af364962072d04d63', response.data['api_id'])
      end
    end

    # Test Localeui::Event.create without project_id
    test 'Localeui::Event.create should not create an event if project not given' do
      Localeui.project_id = nil
      assert_raises NoProjectError do
        Localeui::Event.create
      end
    end
  end
end
