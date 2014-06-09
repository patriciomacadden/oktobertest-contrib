module Oktobertest
  module Assertions
    def assert_equal(expected, actual, message = nil)
      message ||= "#{expected} != #{actual}"
      assert expected == actual, message
    end

    def assert_includes(collection, item, message = nil)
      message ||= "#{collection.inspect} does not include #{item}"
      assert collection.include?(item), message
    end

    def assert_instance_of(klass, object, message = nil)
      message ||= "object is not instance of #{klass}"
      assert object.instance_of?(klass), message
    end

    def assert_kind_of(klass, object, message = nil)
      message ||= "object is not kind of #{klass}"
      assert object.kind_of?(klass), message
    end

    def assert_matches(matcher, object, message = nil)
      message ||= "#{object} does not match #{matcher}"
      assert object =~ matcher, message
    end
  end
end
