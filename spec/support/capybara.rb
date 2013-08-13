require 'capybara/rspec'
require 'capybara/rails'

Capybara.configure do |config|
  config.javascript_driver = (ENV['JS_DRIVER'] || 'webkit').to_sym
end

Capybara.default_wait_time = 10
