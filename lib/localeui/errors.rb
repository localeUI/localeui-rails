# frozen_string_literal: true

module Localeui
  class LocaleuiError < StandardError; end
  class NoProjectError < LocaleuiError; end
  class UnauthorizedError < LocaleuiError; end
  class NotFoundError < LocaleuiError; end
end
