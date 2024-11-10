# frozen_string_literal: true

module Localeui
  class Project
    def self.list
      # show assigned all projects
      puts 'list projects'
    end

    def self.init
      # init project with project api id
      puts 'init project'
    end

    def self.info
      # show project informations
      raise NoProjectError, 'No project initialised' if Localeui::Config.setup.project_id.nil?

      { foo: 'bar' }
    end
  end
end
