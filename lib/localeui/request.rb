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

    def url(endpoit)
      "#{Localeui.config.api_base}#{endpoit}"
    end

    def header
      h = {}
      h['access-token'] = Localeui.config.access_token if Localeui.config.access_token.present?
      h['client'] = Localeui.config.client if Localeui.config.client.present?
      h['uid'] = Localeui.config.uid if Localeui.config.uid

      h
    end
  end
end
