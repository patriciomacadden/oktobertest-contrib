module Oktobertest
  module Assertions
    def assert_equal(expected, actual, message = nil)
      message ||= "#{expected} != #{actual}"
      assert expected == actual, message
    end

    def refute(value, message = nil)
      message ||= "condition is not false: #{value.inspect}"
      flunk message unless !value
    end

    def refute_equal(expected, actual, message = nil)
      message ||= "#{expected} == #{actual}"
      assert expected != actual, message
    end
  end
end
