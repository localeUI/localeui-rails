# frozen_string_literal: true

require 'test_helper'

module Localeui
  class HttpTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::Http.request
    test 'Localeui::Request.request should forward to request informationes from api' do
      VCR.use_cassette 'test_http_request' do
        response = Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        assert response.successful?
      end
    end
  end
end
