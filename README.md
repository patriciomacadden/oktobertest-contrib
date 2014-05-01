# Oktobertest::Contrib

Contributed Oktobertest extensions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oktobertest-contrib', group: :test
# or this if you want to use oktobertest-contrib master
# gem 'oktobertest-contrib', group: :test, github: 'patriciomacadden/oktobertest-contrib'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install oktobertest-contrib
```

## Usage

`require` an extension to use it. If you want to use all of them, just
`require 'oktobertest-contrib'`.

## Available extensions

### Extra assertions

This extension includes a lot of useful assertions. To use it, just require it:

```ruby
require 'oktobertest'
require 'oktobertest/assertions'

scope do
  test do
    expected, actual = 1, 1
    assert_equal expected, actual
  end

  test do
    refute false
  end
end
```

#### Available assertions

* `assert_equal(expected, actual, message)`: asserts that the expected and the
actual values are equal.
* `refute(value, message)`: refutes the expected value (ie. passes if value is
false).
* `refute_equal(expected, actual, message)`: refutes that the expected and the
actual values are equal (ie. passes if expected and actual are not equal).

### Rack related assertions

This extesion includes rack related assertions. To use it, just require it:

```ruby
require 'oktobertest'
require 'oktobertest/rack/test'

module Oktobertest
  class Test
    include Rack::Test::Methods

    def app
      Proc.new { |env| [200, {}, ['hello world']] }
    end
  end
end

scope do
  test 'GET /' do
    get '/'
    assert_status 200
  end
end
```

#### Available assertions

* `assert_status(status_code, message)`: asserts that the response status code
is equal to `status_code`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/oktobertest-contrib/blob/master/LICENSE).
