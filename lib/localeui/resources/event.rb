# frozen_string_literal: true

module Localeui
  class Event
    def self.create
      raise NoProjectError, 'No project initialised' if Localeui.project_id.nil? || Localeui.project_id.empty?

      response = Localeui::Http.request(
        method: :post,
        endpoint: "projects/#{Localeui.project_id}/events"
      )
      Localeui::Utils.logger.info "Event '#{response.data['api_id']}' was successfully created"
      response
    end
  end
end
