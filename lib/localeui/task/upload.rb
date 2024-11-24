# frozen_string_literal: true

module Localeui
  module Task
    class Upload < Base
      class << self
        def upload!
          $stdout.print 'Task complete!'
          true
        end
      end
    end
  end
end
