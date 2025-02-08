# frozen_string_literal: true

require 'test_helper'

module Localeui
  class SourceFileTest < ActiveSupport::TestCase
    setup do
      Localeui.base_api = 'http://localhost:3000/api/v1/'
      Localeui.project_id = 'pro_0b4f5add7890f17a6da4'
      Localeui.api_token = 'a17d532ade27819fc54641fc86298614'
    end

    # Test Localeui::SourceFile.upload
    test 'Localeui::SourceFile.upload should create event and upload file' do
      VCR.use_cassette 'test_source_file_upload' do
        response = Localeui::SourceFile.upload
        assert_equal('evt_046193191090b87598ae', response[:event])
        assert_equal(1, response[:files])
      end
    end

    # Test Localeui::SourceFile.upload without project_id
    test 'Localeui::SourceFile.upload should raise an error if project is not given' do
      Localeui.project_id = nil
      assert_raises NoProjectError do
        Localeui::SourceFile.upload
      end
    end
  end
end
