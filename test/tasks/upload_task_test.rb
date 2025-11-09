# frozen_string_literal: true

require 'test_helper'
require 'rake'

puts 'UPLOAD TASK'

module Localeui
  class UploadTaskTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # test 'task localeui:upload should return true' do
    #   assert_output(/complete!/) do
    #     assert Rake::Task['localeui:upload'].invoke
    #   end
    # end
  end
end
