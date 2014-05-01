require 'helper'

scope 'assert_equal' do
  test 'passes if expected == actual' do
    assert_equal 1, 1
  end

  test 'fails if expected != actual' do
    assert_raises(Oktobertest::TestFailed) { assert_equal 1, 2 }
  end
end

scope 'refute' do
  test 'passes if the value is false' do
    refute false
  end

  test 'fails if the value is true' do
    assert_raises(Oktobertest::TestFailed) { refute true }
  end
end

scope 'refute_equal' do
  test 'passes if expected != actual' do
    refute_equal 1, 2
  end

  test 'fails if expected == actual' do
    assert_raises(Oktobertest::TestFailed) { refute_equal 1, 1 }
  end
end
