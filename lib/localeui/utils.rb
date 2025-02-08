# frozen_string_literal: true

require 'pathname'

module Localeui
  module Utils
    class << self
      def logger
        Logger.new($stdout)
      end

      def root
        Pathname.new(rails_root || Dir.getwd)
      end

      def rails_root
        return ::Rails.root.to_s if defined?(::Rails.root) && ::Rails.root
        return RAILS_ROOT.to_s if defined?(RAILS_ROOT)

        nil
      end
    end
  end
end
