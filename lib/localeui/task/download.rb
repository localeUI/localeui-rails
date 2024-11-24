# frozen_string_literal: true

module Localeui
  module Task
    class Download < Base
      class << self
        def download
          $stdout.print 'Task complete!'
          true
        end
      end
    end
  end
end
