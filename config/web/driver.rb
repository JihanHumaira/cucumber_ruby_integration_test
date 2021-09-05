# frozen_string_literal: true

browser = (ENV['BROWSER'] || 'docker').to_sym
user_agent = ENV['USER_AGENT'] || 'preproduction'
wait_time = 60 * 5

puts "Browser   : #{browser}"
puts "User Agent: #{user_agent}"


Capybara.register_driver :docker do |app|
  @args = [ 
    "--user-agent=#{user_agent}",
    '--no-sandbox',
    '--disable-dev-shm-usage',
    # '--headless',
    '--disable-web-security',
    '--window-size=1366x768'
  ]
  options = Selenium::WebDriver::Chrome::Options.new(args: @args)
  options.add_option("useAutomationExtension", false);
  client = Selenium::WebDriver::Remote::Http::Default.new(
    open_timeout: wait_time,
    read_timeout: wait_time
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options,
    http_client: client
  )
end

Capybara.configure do |config|
  config.default_max_wait_time = 20
end

Capybara::Screenshot.register_driver(browser) do |driver, path|
  driver.browser.save_screenshot path
end

Capybara.default_driver = browser
Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy = { keep: 50 }
Capybara::Screenshot.append_timestamp = true
