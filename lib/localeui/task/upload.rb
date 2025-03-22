# frozen_string_literal: true

module Localeui
  module Task
    class Upload < Base
      class << self
        def upload!
          Localeui::SourceFile.upload
          Localeui::Utils.logger.info 'Task complete!'
          true
        end
      end
    end
  end
end
