Then('Users can found their name') do
    @browser = UserPage.new
    expect(@browser.name.text).to eq(ENV['NAME'])
  end
