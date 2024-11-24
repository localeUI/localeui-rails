# frozen_string_literal: true

module Localeui
  class Http
    def self.request(method:, endpoint:, params: {})
      request = Localeui::Request.new
      request.send(method, endpoint, params)
    end
  end
end
