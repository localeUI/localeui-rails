# frozen_string_literal: true

module Localeui
  class Config
    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    attr_reader :api_base, :access_token, :client, :uid, :project_id

    def initialize
      config = read_config_file
      @api_base = config['ApiBase'] || Localeui::DEFAULT_API_BASE

      # Authentication values
      @access_token = config['AccessToken']
      @client = config['Client']
      @uid = config['Uid']

      # Project values
      @project_id = config['ProjectId']
    end

    def api_base=(value)
      config = read_config_file
      config['ApiBase'] = value
      write_config_file(config)
      @api_base = config['ApiBase']
    end

    def access_token=(value)
      config = read_config_file
      config['AccessToken'] = value
      write_config_file(config)
      @access_token = config['AccessToken']
    end

    def client=(value)
      config = read_config_file
      config['Client'] = value
      write_config_file(config)
      @client = config['Client']
    end

    def uid=(value)
      config = read_config_file
      config['Uid'] = value
      write_config_file(config)
      @uid = config['Uid']
    end

    def project_id=(value)
      config = read_config_file
      config['ProjectId'] = value
      write_config_file(config)
      @project_id = config['ProjectId']
    end

    private

    def config_file
      "#{Rails.root}/#{Localeui::DEFAULT_CONFIG_FILE}"
    end

    # def gitignore_file
    #   Rails.root.join('.gitignore')
    # end

    def read_config_file
      return {} unless File.exist?(config_file)

      YAML.load_file(config_file)
    end

    # def create_config_file
    #   config = {}
    #   config['ApiBase'] = Localeui::DEFAULT_API_BASE
    #   write_config_file(config)
    #   File.open(gitignore_file, 'a') { |f| f.write "\n# Ignore localeui config.\n#{FILE_NAME}\n" }
    # end

    def write_config_file(config)
      File.open(config_file, 'w') { |f| YAML.dump(config, f) }
    end
  end
end
