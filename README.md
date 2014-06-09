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

### Optional dependencies

* [rack-test](https://github.com/brynary/rack-test) if you want to use
`oktobertest/rack/test`.
* [capybara](https://github.com/jnicklas/capybara) and
[poltergeist](https://github.com/teampoltergeist/poltergeist) if you want to use
`oktobertest/capybara`.

## Usage

`require` an extension to use it. If you want to use all of them, just
`require 'oktobertest/contrib'`.

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
end
```

#### Available assertions

* `assert_equal(expected, actual, message)`: asserts that the expected and the
actual values are equal.
* `assert_includes(collection, item, message)`: asserts that the collection
includes the item.
* `assert_instance_of(klass, object, message)`: asserts that the object is an
instance of class.
* `assert_kind_of(klass, object, message)`: asserts that the object is kind of
class.
* `assert_matches(matcher, object, message)`: asserts that the object matches
the matcher.

### Rack related assertions

This extesion includes rack related assertions. To use it, just require it:

```ruby
require 'oktobertest'
require 'oktobertest/rack/test'

scope do
  setup do
    @app = Proc.new { |env| [200, {}, ['hello world']] }
  end

  test 'GET /' do
    get '/'
    assert_status 200
    # equivalent to:
    # assert_equal 200, last_response.status
  end
end
```

#### Available assertions

* `assert_status(status_code, message)`: asserts that the response status code
is equal to `status_code`.
* `assert_header(header, value, message)`: asserts that the response header
`header` is equal to `value`.

### Capybara

This extension includes automatic setup for
[Capybara](https://github.com/jnicklas/capybara).

```ruby
require 'oktobertest'
require 'oktobertest/capybara'

Capybara.app = App

scope do
  test 'works' do
    visit '/'
    assert page.has_content? 'hello world'
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/oktobertest-contrib/blob/master/LICENSE).
