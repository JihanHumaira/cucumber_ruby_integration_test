Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--user-agent=#{user_agent}")
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-notifications')
    options.add_argument('--window-size=1366,768')
    # handle basic auth
    options.add_argument('--disable-blink-features=BlockCredentialedSubresources')
    options.add_argument('--disable-blink-features=AutomationControlled')
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.open_timeout = wait_time
    client.read_timeout = wait_time
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options,
      http_client: client
    )
end