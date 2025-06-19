# frozen_string_literal: true

module Localeui
  module Task
    class ProjectInfo < Base
      class << self
        def project_info!
          Localeui::Project.info
        end
      end
    end
  end
end
