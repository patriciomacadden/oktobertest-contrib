require 'rack/test'

module Oktobertest
  module Assertions
    def assert_status(status_code, message = nil)
      message ||= "expected status code to be #{status_code}, got #{last_response.status} instead"
      assert_equal status_code, last_response.status, message
    end

    def assert_header(header, value, message = nil)
      message ||= "expected header #{header} to be #{value}, got #{last_response.headers[header]} instead"
      assert_equal value, last_response.headers[header]
    end
  end

  class Test
    include Rack::Test::Methods

    def app
      @app
    end
  end
end
