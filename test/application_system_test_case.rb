require "test_helper"
require 'support/with_clues'

Capybara.register_driver :root_headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions": {
      args: [
        "headless",
        "disable-gpu",
        "no-sandbox",
        "disable-dev-shm-usage",
        "whitelisted-ips"
      ]
    },
    "goog:loggingPrefs": { browser: "ALL" }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues
  driven_by :rack_test
end

class BrowserSystemTestCase < ApplicationSystemTestCase
  driven_by :root_headless_chrome, screen_size: [1400, 1400]
end
