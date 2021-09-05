# frozen_string_literal: true

class LoginPage < SitePrism::Page
    path = '/login'
    set_url(ENV['BASE_URL'] + path)
  
    element :phone_number_text_field, :xpath, "//input[@placeholder='Nomor Telepon Anda']"
    element :password_text_field, :xpath, "//input[@placeholder='Kata Sandi Anda']"
    element :login_button, '.btn.btn--brand.btn--block.btn--large'
  end
  