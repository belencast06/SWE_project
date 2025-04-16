# features/support/env.rb
require 'cucumber/rails'
require 'capybara/cucumber'

# Database cleaner setup
DatabaseCleaner.strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

# Reset sessions between scenarios
Before do
  Capybara.reset_sessions!
end