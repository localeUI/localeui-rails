# frozen_string_literal: true

require 'test_helper'

module Localeui
  class SourceFileTest < ActiveSupport::TestCase
    setup do
      Localeui.config.api_base = 'http://localhost:3000/api/v1/'
      Localeui.config.project_id = 'pro_b220f2fa5637fa4c6c74'
    end

    # Method: Localeui::SourceFile.upload
    test 'Localeui::SourceFile.upload should raise an error, if no project is set up' do
      Localeui.config.project_id = nil
      assert_raises Localeui::NoProjectError do
        Localeui::SourceFile.upload
      end
    end

    test 'Localeui::SourceFile.upload create event and upload files' do
      VCR.use_cassette 'test_source_file_upload_valid_files' do
        response = Localeui::SourceFile.upload
        assert response.successful?
      end
    end
  end
end
