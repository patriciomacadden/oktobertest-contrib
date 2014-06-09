require 'helper'

scope 'assert_status' do
  setup do
    @app = Proc.new { |env| [200, {}, ['hello world']] }
  end

  test "passes if the argument matches last response's status" do
    get '/'
    assert_status 200
  end

  test "fails if the argument does not match last response's status" do
    get '/'
    assert_raises(Oktobertest::TestFailed) { assert_status 404 }
  end
end

scope 'assert_status' do
  setup do
    @app = Proc.new { |env| [200, { 'Content-Type' => 'text/plain' }, ['hello world']] }
  end

  test "passes if the argument matches last response's header" do
    get '/'
    assert_header 'Content-Type', 'text/plain'
  end

  test "fails if the argument does not match last response's header" do
    get '/'
    assert_raises(Oktobertest::TestFailed) { assert_header 'Content-Type', 'text/html' }
  end
end

scope 'without setting @app' do
  test 'fails' do
    assert_raises(NoMethodError) { get '/' }
  end
end
