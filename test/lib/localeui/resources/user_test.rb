# frozen_string_literal: true

require 'test_helper'

module Localeui
  class UserTest < ActiveSupport::TestCase
    setup do
      Localeui.config.api_base = 'http://localhost:3000/api/v1/'
    end

    ## Method: Localeui::User.sign_in
    test 'Localeui::User.sign_in should raise an error, if params missing' do
      assert_raises ArgumentError do
        Localeui::User.sign_in
      end
    end

    test 'Localeui::User.sign_in should not sign in with invalid params' do
      VCR.use_cassette 'test_user_sign_in_with_invalid_params' do
        assert_raises Localeui::UnauthorizedError do
          Localeui::User.sign_in('invalid@mail.com', 'invalid')
        end
      end
    end

    test 'Localeui::User.sign_in should sign in with valid params' do
      VCR.use_cassette 'test_user_sign_in_with_valid_params' do
        response = Localeui::User.sign_in('valid@mail.com', 'valid')
        assert response.successful?
      end
    end

    ## Method: Localeui::User.sign_out
    test 'Localeui::User.sign_out should not sign out with invalid header tokens' do
      VCR.use_cassette 'test_user_sign_out_with_invalid_tokens' do
        assert_raises Localeui::NotFoundError do
          Localeui::User.sign_out
        end
      end
    end

    test 'Localeui::User.sign_out should sign out the user' do
      VCR.use_cassette 'test_user_sign_out' do
        response = Localeui::User.sign_out
        assert response.successful?
      end
    end
  end
end
