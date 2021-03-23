# frozen_string_literal: true

require 'capybara/rspec'
require 'require_all'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

require_all 'models'
require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'spec/support'

include FeatureHelper

RSpec.configure do
  def options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1200,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
