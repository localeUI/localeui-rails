# frozen_string_literal: true

module Localeui
  class SourceFile
    def self.upload # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      raise NoProjectError, 'No project initialised' if Localeui.config.project_id.nil?

      # Get all source files
      files = all

      # Create event
      event_response = Localeui::Http.request(
        method: :post,
        endpoint: "projects/#{Localeui.config.project_id}/events"
      )

      # Submit each file
      files.each do |file|
        Localeui::Http.request(
          method: :post,
          endpoint: "projects/#{Localeui.config.project_id}/source_files/upload",
          params: {
            filename: file,
            event_id: event_response.data['api_id'],
            file: HTTP::FormData::File.new(Rails.root.join("config/locales/#{file}"), content_type: 'application/yaml')
          }
        )
      end

      event_response
    end

    def self.download; end

    def self.all
      files = Dir.glob(Rails.root.join('config/locales/**/*'))
      files.map { |file| file[Rails.root.join('config/locales/').to_s.length..] }
    end

    def self.load_yaml(filename)
      path = Rails.root.join("config/locales/#{filename}")
      YAML.load_file(path)
    end
  end
end
