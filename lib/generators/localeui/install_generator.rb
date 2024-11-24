# frozen_string_literal: true

require 'rails/generators'

module Localeui
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Creates a LocaleUI config file.'
      def copy_config
        template 'localeui_config.rb', "#{Rails.root}/config/localeui.rb"
      end
    end
  end
end
