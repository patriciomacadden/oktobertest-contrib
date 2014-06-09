require 'helper'

scope 'Capybara' do
  scope 'if Capybara.app is defined' do
    setup do
      @app = ->(env) { [200, {}, ['hello world']] }
    end
  
    setup do
      Capybara.app = @app
    end
  
    test 'works' do
      visit '/'
      assert page.has_content? 'hello world'
    end
  end

  test 'Capybara::DSL is included' do
    assert self.class.included_modules.include? Capybara::DSL
  end
end
