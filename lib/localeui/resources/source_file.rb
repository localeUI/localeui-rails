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

      { event: event.body['api_id'], files: files.count }
    end

    def self.download
      raise NoProjectError, 'No project initialised' if Localeui.project_id.nil?

      # TODO: think about, if we want to create an event

      # Request all source files
      files_response = files_to_download

      # Request all locales
      locales_response = locales_to_download

      # Request each source file with file content
      locales_response.body.each do |locale|
        files_response.body.each do |file|
          downloaded_file_response = download_file(file, locale)
          store_file(downloaded_file_response)
        end
      end
    end

    def self.files_to_download
      response = Localeui::Http.request(
        method: :get, endpoint: "projects/#{Localeui.project_id}/source_files"
      )
      Localeui::Utils.logger.info "#{response.body.count} files will be downloaded"
      response
    end

    def self.locales_to_download
      response = Localeui::Http.request(
        method: :get, endpoint: "projects/#{Localeui.project_id}/locales"
      )
      Localeui::Utils.logger.info "#{response.body.count} locale(s) available"
      response
    end

    def self.store_file(file) # rubocop:disable Metrics/AbcSize
      if Rails.env.test?
        Localeui::Utils.logger.info "Skipping file storage for '#{file.body['name']}' in test environment"
        return
      end

      file_path = [Localeui.locales_path, file.body['name']].join('/')
      File.open file_path, 'w' do |f|
        f.write YAML.dump(file.body['content'])
        f.close
      end
      Localeui::Utils.logger.info "File '#{file.body['name']}' has been successfully stored under '#{file_path}'"
    end

    def self.download_file(file, locale)
      response = Localeui::Http.request(
        method: :get,
        endpoint: "projects/#{Localeui.project_id}/source_files/#{file['api_id']}?locale_id=#{locale['api_id']}"
      )
      Localeui::Utils.logger.info "File '#{response.body['name']}' has been successfully downloaded"
      response
    end

    def self.file_upload(file, event)
      file_path = [Localeui.locales_path, file].join('/')

      response = Localeui::Http.request(
        method: :post, endpoint: "projects/#{Localeui.project_id}/source_files", params: {
          filename: file, event_id: event.body['api_id'],
          content: YAML.load_file(file_path).to_json
        }
      )
      Localeui::Utils.logger.info "File '#{file}' has been successfully uploaded"
      response
    end

    def self.all
      Dir.glob("#{Localeui.locales_path}/**/*")
         .select { |path| File.file?(path) }
         .map { |path| path.delete_prefix("#{Localeui.locales_path}/") }
    end
  end
end
