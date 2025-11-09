# frozen_string_literal: true

module Localeui
  class LocaleuiError < StandardError; end
  class BadRequestError < LocaleuiError; end
  class ForbiddenError < LocaleuiError; end
  class NoBaseApiError < LocaleuiError; end
  class NoApiTokenError < LocaleuiError; end
  class NoProjectError < LocaleuiError; end
  class NotFoundError < LocaleuiError; end
  class UnauthorizedError < LocaleuiError; end
end
