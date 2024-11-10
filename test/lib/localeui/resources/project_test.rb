# frozen_string_literal: true

require 'test_helper'

module Localeui
  class ProjectTest < ActiveSupport::TestCase
    setup do
      Localeui.config.api_base = 'http://localhost:3000/api/v1/'
    end

    ## Test Localeui::Project.init
    test 'Localeui::Project.init should not init the project with unknown api_id' do
<<<<<<< HEAD
=======
      Localeui::User.sign_in('info@cobarian.de', 'kitesurfen')
>>>>>>> 3ecf507 (implement project methods)
      VCR.use_cassette 'test_project_init_with_unknown_api_id' do
        assert_raises Localeui::NotFoundError do
          Localeui::Project.init('pro_12345667890')
        end
        assert_not_equal('pro_12345667890', Localeui.config.project_id)
      end
    end

    test 'Localeui::Project.init should init the project with valid api_id' do
      VCR.use_cassette 'test_project_init_with_valid_api_id' do
        response = Localeui::Project.init('pro_b220f2fa5637fa4c6c74')
        assert response.successful?
        assert_equal('pro_b220f2fa5637fa4c6c74', Localeui.config.project_id)
      end
    end

    ## Test Localeui::Project.info
    test 'Localeui::Project.info should raise an error, if no project is set up' do
      assert_raises Localeui::NoProjectError do
        Localeui::Project.info
      end
    end

    test 'Localeui::Project.info should return project informations' do
<<<<<<< HEAD
=======
      Localeui::User.sign_in('info@cobarian.de', 'kitesurfen')
>>>>>>> 3ecf507 (implement project methods)
      Localeui.config.project_id = 'pro_b220f2fa5637fa4c6c74'
      VCR.use_cassette 'test_project_info_with_valid_api_id' do
        response = Localeui::Project.info
        assert response.successful?
        assert_equal(Localeui.config.project_id, response.data['api_id'])
      end
    end
  end
end
