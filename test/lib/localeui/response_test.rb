# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ResponseTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::Response successful
    test 'Localeui::Response successful response should be valid' do
      VCR.use_cassette 'test_successful_response' do
        response = Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        assert_equal('Localeui::Response', response.class.name)
        assert response.successful?
      end
    end

    # Test Localeui::Response BadRequestError
    test 'Localeui::Response bad request response should raise error' do
      Localeui.project_id = 'bad_request'
      VCR.use_cassette 'test_response_bad_request' do
        assert_raises BadRequestError do
          Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        end
      end
    end

    # Test Localeui::Response UnauthorizedError
    test 'Localeui::Response unauthorized response should raise error' do
      Localeui.api_token = '123456'
      VCR.use_cassette 'test_response_unauthorized' do
        assert_raises UnauthorizedError do
          Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        end
      end
    end

    # Test Localeui::Response ForbiddenError
    test 'Localeui::Response forbidden response should raise error' do
      Localeui.api_token = '627c2d74b64ba3944f4040647bbd95ed'
      VCR.use_cassette 'test_response_forbidden' do
        assert_raises ForbiddenError do
          Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        end
      end
    end

    # Test Localeui::Response NotFoundError
    test 'Localeui::Response not found response should raise error' do
      VCR.use_cassette 'test_response_not_found' do
        assert_raises NotFoundError do
          Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}test")
        end
      end
    end

    # Test Localeui::Response Localeui
    test 'Localeui::Response error response should raise error' do
      Localeui.project_id = 'other_error'
      VCR.use_cassette 'test_response_other_error' do
        assert_raises LocaleuiError do
          Localeui::Http.request(method: :get, endpoint: "projects/#{Localeui.project_id}")
        end
      end
    end
  end
end
