# frozen_string_literal: true

module Localeui
  class Project
    def self.info
      # show project informations
      raise NoProjectError, 'No project initialised' if Localeui.project_id.nil? || Localeui.project_id.empty?

      response = Localeui::Http.request(
        method: :get,
        endpoint: "projects/#{Localeui.project_id}"
      )
      Localeui::Utils.logger.info "Project '#{response.body['api_id']}' informations were successfully requested"
      response
    end
  end
end
