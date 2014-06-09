require 'helper'

scope 'assert_equal' do
  test 'passes if expected == actual' do
    assert_equal 1, 1
  end

  test 'fails if expected != actual' do
    assert_raises(Oktobertest::TestFailed) { assert_equal 1, 2 }
  end
end

scope 'assert_includes' do
  setup do
    @collection = %w(one two three)
  end

  test 'passes if collection.include? item' do
    assert_includes @collection, 'one'
  end

  test 'fails if !collection.include? item' do
    assert_raises(Oktobertest::TestFailed) { assert_includes @collection, 'four' }
  end
end

scope 'assert_instance_of' do
  test 'passes if object.instance_of? klass' do
    assert_instance_of Array, [1, 2, 3]
  end

  test 'fails if !object.instance_of? klass' do
    assert_raises(Oktobertest::TestFailed) { assert_instance_of Array, { one: 1 } }
  end
end

scope 'assert_kind_of' do
  test 'passes if object.kind_of? klass' do
    assert_kind_of StandardError, ArgumentError.new
  end

  test 'fails if !object.kind_of? klass' do
    assert_raises(Oktobertest::TestFailed) { assert_kind_of StandardError, ScriptError.new }
  end
end

scope 'assert_matches' do
  test 'passes if object =~ matcher' do
    assert_matches /123/, '123'
  end

  test 'fails if object !~ matcher' do
    assert_raises(Oktobertest::TestFailed) { assert_matches /123/, '345' }
  end
end
