Feature: Transaction
  Scenario: Create trasnsaction use ATM transfer payment method
    
    Given user get link from seller evermos
    When Users visit the link
    And Users select a product
    And Users add the product to cart
    And Users see the cart
    And Users fill receiver address
    And Users select the ATM Transfer payment method
    Then Users can see the transaction at user transaction

