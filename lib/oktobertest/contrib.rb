require 'oktobertest/assertions'
begin
  require 'oktobertest/capybara'
rescue LoadError
end
require 'oktobertest/contrib/version'
begin
  require 'oktobertest/rack/test'
rescue LoadError
end
