# frozen_string_literal: true

require 'rake'
require 'localeui'

namespace :localeui do
  desc 'Upload all translation source files to localeUI'
  task upload: :environment do
    Localeui::Task::Upload.upload!
  end

  desc 'Download all translation source files to localeUI'
  task download: :environment do
    Localeui::Task::Download.download!
  end
end
