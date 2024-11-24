# frozen_string_literal: true

module Localeui
  class Project
    def self.init(api_id)
      # init project with project api id
      response = Localeui::Http.request(
        method: :get,
        endpoint: "projects/#{api_id}"
      )
      Localeui.config.project_id = response.data['api_id']
      response
    end

    def self.info
      # show project informations
      raise NoProjectError, 'No project initialised' if Localeui::Config.setup.project_id.nil?

      Localeui::Http.request(
        method: :get,
        endpoint: "projects/#{Localeui.config.project_id}"
      )
    end
  end
end
