require 'rack/test'
require 'helper'

module Oktobertest
  class Test
    include Rack::Test::Methods

    def app
      Proc.new { |env| [200, {}, ['hello world']] }
    end
  end
end

scope 'assert_status' do
  test "passes if the argument matches last response's status" do
    get '/'
    assert_status 200
  end

  test "fails if the argument does not match last response's status" do
    get '/'
    assert_raises(Oktobertest::TestFailed) { assert_status 404 }
  end
end
