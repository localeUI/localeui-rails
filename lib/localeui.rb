# frozen_string_literal: true

# Version
require 'localeui/version'

# Resources
require 'localeui/resources/event'
require 'localeui/resources/project'
require 'localeui/resources/source_file'

# Supporting classes
require 'localeui/errors'
require 'localeui/http'
require 'localeui/request'
require 'localeui/response'
require 'localeui/utils'

# Tasks classes
require 'localeui/task/base'
require 'localeui/task/download'
require 'localeui/task/upload'
require 'localeui/railtie' if defined?(Rails)

module Localeui
  class << self
    attr_accessor :base_api, :api_token, :project_id, :locales_path, :allow_overwriting

    def config
      yield self
    end
  end
end
