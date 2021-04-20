# frozen_string_literal: true

require 'capybara/cucumber'
require 'dotenv/load'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

require_all 'models'
require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'spec/test_data'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1200,1000])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

at_exit do
  # Remove file with user credentials after cucumber run
  FileUtils.remove_file(ENV['CREDS_PATH'])
end
