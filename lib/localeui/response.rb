# frozen_string_literal: true

require 'localeui/response/status_codes'

module Localeui
  class Response
    include StatusCodes

    attr_reader :request, :response, :headers, :status, :body, :data

    def initialize(request, response)
      @request = request
      @response = response
      init_header
      init_body
      identifiy_errors
    end

    def successful?
      @status == HTTP_OK_CODE
    end

    private

    def init_header
      @headers = @response.headers
      @status = @response.status
    end

    def init_body
      @body = JSON.parse(@response.body)
      @data = @body['data'] if @body.key?('data')
    end

    def identifiy_errors
      return nil if successful?

      raise_error
    end

    def raise_error
      error = error_class.new(@body)
      raise error
    end

    def error_class # rubocop:disable Metrics/MethodLength
      case @status
      when HTTP_BAD_REQUEST_CODE
        BadRequestError
      when HTTP_UNAUTHORIZED_CODE
        UnauthorizedError
      when HTTP_FORBIDDEN_CODE
        ForbiddenError
      when HTTP_NOT_FOUND_CODE
        NotFoundError
      else
        LocaleuiError
      end
    end
  end
end
