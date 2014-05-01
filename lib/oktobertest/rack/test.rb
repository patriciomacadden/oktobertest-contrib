module Oktobertest
  module Assertions
    def assert_status(status_code, message = nil)
      message ||= "expected status code to be #{status_code}, got #{last_response.status} instead"
      assert_equal status_code, last_response.status, message
    end
  end
end
