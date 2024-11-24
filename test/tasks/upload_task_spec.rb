# frozen_string_literal: true

require 'test_helper'
require 'rake'

module Localeui
  class UploadTaskTest < ActiveSupport::TestCase
    setup do
      Rails.application.load_tasks
    end

    test 'task localeui:upload should print "Task complete! "' do
      puts 'WUSA'
      expect(-> { Rake::Task['localeui:upload'].invoke }).to output(/complete!/).to_stdout
    end
  end
end
