# frozen_string_literal: true

module Localeui
  module Task
    class ProjectInfo < Base
      class << self
        def project_info!
          response = Localeui::Project.info
          pp response.body
          true
        end
      end
    end
  end
end
