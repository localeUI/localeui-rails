# frozen_string_literal: true

require 'http'

module Localeui
  class Request
    def send(method, endpoint, params)
      http_request = HTTP.headers(header)
      response = http_request.public_send(method, url(endpoint), form: params)
      Localeui::Response.new(http_request, response)
    end

    private

    def url(endpoint)
      raise NoBaseApiError, 'No api url set' if Localeui.base_api.nil? || Localeui.base_api.empty?

      "#{Localeui.base_api}#{endpoint}"
    end

    def header
      raise NoApiTokenError, 'No api token set' if Localeui.api_token.nil? || Localeui.api_token.empty?

      { Authorization: "Bearer #{Localeui.api_token}" }
    end
  end
end
