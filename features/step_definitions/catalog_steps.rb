When('Users click account icon') do
    @browser = CatalogPage.new
    click_button("LAIN KALI") if page.has_css?(".onesignal-popover-dialog")
    sleep 2
    @browser.akun_icon.click
  end
