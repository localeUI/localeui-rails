# frozen_string_literal: true

require 'rake'
require "#{Rails.root}/config/localeui"

namespace :localeui do
  desc 'Upload all translation source files to localeUI'
  task :upload do
    Localeui::Task::Upload.upload!
  end

  desc 'Download all translation source files to localeUI'
  task :download do
    Localeui::Task::Download.download!
  end
end
