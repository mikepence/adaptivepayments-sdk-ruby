# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'capybara/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

if ENV["SELENIUM"]
  Capybara.default_driver = :selenium
end

if ENV["APP_HOST"]
  Capybara.app_host = ENV["APP_HOST"]
  Capybara.run_server = false
end

RSpec.configure do |config|
  # config.use_transactional_fixtures = true
  config.include Capybara::DSL
  config.include CheckSample
end
