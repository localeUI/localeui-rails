# frozen_string_literal: true

# Version
require 'localeui/version'

# Resources
require 'localeui/resources/project'
require 'localeui/resources/source_file'
require 'localeui/resources/user'

# Supporting classes
require 'localeui/config'
require 'localeui/errors'
require 'localeui/http'
require 'localeui/request'
require 'localeui/response'

module Localeui
  # API default params
  DEFAULT_API_BASE = 'http://localhost:3000/api/v1/'
  DEFAULT_CONFIG_FILE = '.localui.yml'

  @config = Localeui::Config.setup

  class << self
    attr_reader :config

    # User configurable options
    # def_delegators :@config, :api_base, :api_base=

    # def locales_path
    #   @locales_path || "#{Rails.root}/config/locales"
    # end

    # def file_ext_regexp
    #   @file_ext_regexp || /\.ya?ml\z/i
    # end

    # def import_opts
    #   @import_opts || {
    #     format: 'yaml',
    #     placeholder_format: :icu,
    #     yaml_include_root: true,
    #     original_filenames: true,
    #     directory_prefix: '',
    #     indentation: '2sp'
    #   }
    # end

    # def export_opts
    #   @export_opts || {}
    # end

    # def import_safe_mode
    #   @import_safe_mode.nil? ? false : @import_safe_mode
    # end

    # def skip_file_export
    #   @skip_file_export || ->(_) { false }
    # end
  end
end
