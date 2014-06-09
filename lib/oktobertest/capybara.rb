require 'capybara'
require 'capybara/poltergeist'

module Oktobertest
  class Scope
    module Capybara
      def initialize(name = nil, &block)
        super
        teardown { Capybara.reset_sessions! }
      end
    end

    include Capybara
  end

  class Test
    include Capybara::DSL
  end
end

Capybara.default_driver = :poltergeist
