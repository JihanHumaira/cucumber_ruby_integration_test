# frozen_string_literal: true

class UserPage < SitePrism::Page
    element :name, :xpath, '//*[@id="__layout"]/div/div[3]/div[1]/div/div[1]'
  end
  