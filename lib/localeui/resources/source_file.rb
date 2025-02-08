# frozen_string_literal: true

module Localeui
  class SourceFile
    def self.upload
      raise NoProjectError, 'No project initialised' if Localeui.project_id.nil?

      # Get all source files
      files = all

      # Create event
      event = Localeui::Event.create

      # Submit each file
      files.each do |file|
        file_upload(file, event)
      end

      { event: event.data['api_id'], files: files.count }
    end

    def self.download; end

    def self.file_upload(file, event)
      response = Localeui::Http.request(
        method: :post, endpoint: "projects/#{Localeui.project_id}/source_files/upload", params: {
          filename: file, event_id: event.data['api_id'],
          file: HTTP::FormData::File.new(Rails.root.join("config/locales/#{file}"), content_type: 'application/yaml')
        }
      )
      Localeui::Utils.logger.info "File '#{file}' was successfully uploaded"
      response
    end

    def self.all
      files = Dir.glob(Rails.root.join('config/locales/**/*'))
      files.map { |file| file[Rails.root.join('config/locales/').to_s.length..] }
    end
  end
end
