Feature: Login

  @positive
  Scenario: Succes login
    Given user have registered before
    When Users visit login page
    And Users fill username text field
    And Users fill password text field
    And Users click login button
    And Users click account icon
    Then Users can found their name

  @negative
  Scenario: Failed login wrong password
    Given user have registered before
    When Users visit login page
    And Users fill username text field
    And Users fill password text field
    And Users click login button
    Then Users see error message "Nomor ini belum terdaftar sebagai reseller"

   @negative 
   Scenario: Failed login wrong username
     Given user have registered before
     When Users visit login page
     And Users fill username text field
     And Users fill password text field
     And Users click login button
     Then Users see error message "Nomor Telepon atau Kata Sandi anda salah!"
