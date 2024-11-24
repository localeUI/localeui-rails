# frozen_string_literal: true

module Localeui
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/localeui_tasks.rake'
    end
  end
end
