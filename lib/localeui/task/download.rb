# frozen_string_literal: true

module Localeui
  module Task
    class Download < Base
      class << self
        def download!
          Localeui::SourceFile.download
          Localeui::Utils.logger.info 'Task complete!'
          true
        end
      end
    end
  end
end
