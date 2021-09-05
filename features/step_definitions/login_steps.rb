When('Users visit login page') do
    visit 'https://evermos.com/login'
  end
  
  When('Users fill username text field') do
    @browser = LoginPage.new
    @browser.load
    @browser.phone_number_text_field.set(@phone_number)
  end
  
  When('Users fill password text field') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  When('Users click login button') do
    pending # Write code here that turns the phrase above into concrete actions
  end