Feature: Login
  Scenario: Succes login
    Given user have registered before
    When Users visit login page
    And Users fill username text field
    And Users fill password text field
    And Users click login button
    And Users click account icon
    Then Users can found their name

