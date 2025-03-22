# frozen_string_literal: true

require 'localeui'

Localeui.config do |config|
  # These are mandatory parameters that must be set before rake tasks are executed
  # Base API Endpoint
  config.base_api = 'http://localhost:3000/api/v1/'

  # Authentication Token
  config.api_token = ''

  # Project API ID
  config.project_id = ''

  # Path of the translation files
  config.locales_path = "#{Rails.root}/config/locales"
end
