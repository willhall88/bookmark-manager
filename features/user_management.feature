Feature: User management
  In order to use the site
  As a viewer
  I want register as a user

  Scenario: signing up 
    Given I am on the homepage
    When I press "Sign Up"
    And I fill in "name" with "Will"
    And I fill in "email" with "willhall88@hotmail.com"
    And I fill in "password" with "lemon"
    And I press "Sign Up"
    Then I should see "Welcome Will"