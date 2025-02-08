# frozen_string_literal: true

require 'test_helper'

module Localeui
  class RequestTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::Request.send
    test 'Localeui::Request.send should request informationes from api' do
      VCR.use_cassette 'test_request_send' do
        request = Localeui::Request.new
        response = request.send(:get, "projects/#{Localeui.project_id}", {})
        assert response.successful?
      end
    end

    test 'Localeui::Request.send should raise error if base_api not given' do
      Localeui.base_api = nil
      assert_raises Localeui::NoBaseApiError do
        request = Localeui::Request.new
        request.send(:get, "projects/#{Localeui.project_id}", {})
      end
    end

    test 'Localeui::Request.send should raise error' do
      Localeui.api_token = nil
      assert_raises Localeui::NoApiTokenError do
        request = Localeui::Request.new
        request.send(:get, "projects/#{Localeui.project_id}", {})
      end
    end
  end
end
