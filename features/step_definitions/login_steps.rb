When('Users visit login page') do
    visit 'https://evermos.com/login'
  end
  
  When('Users fill username text field') do
    @browser = LoginPage.new
    @browser.load
    @browser.phone_number_text_field.set(@phone_number)
    sleep 2
  end
  
  When('Users fill password text field') do
    @browser.page.execute_script "window.scrollTo(0,300)"
    sleep 3
    @browser.password_text_field.set(@password)
    sleep 2
  end
  
  When('Users click login button') do
    @browser.login_button.click
    sleep 2
  end