# frozen_string_literal: true

require 'test_helper'
require 'rake'

puts 'UPLOAD TASK'

module Localeui
  class DownloadTaskTest < ActiveSupport::TestCase
    test 'task localeui:download should return true' do
      assert_output(/complete!/) do
        assert Rake::Task['localeui:download'].invoke
      end
    end
  end
end
