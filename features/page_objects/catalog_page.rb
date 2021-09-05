# frozen_string_literal: true

class CatalogPage < SitePrism::Page
    path = '/catalog'
    set_url(ENV['BASE_URL'] + path)
  
    element :akun_icon, :xpath, '//*[@id="__layout"]/div/div[16]/div/a[5]'
  end
  