Feature: View visits the Home Page
  In order to read the page
  As a viewer
  I want to see the homepage

  Scenario: View the homepage
    Given I am on the homepage
    Then I should see "Bookmark Manager"

  Scenario: Adding a link
    Given I am on the homepage
    When I fill in the "title" with "Makers Academy"
    And I fill in the "url" with "https://www.makersacademy.com"
    And I click "Add Bookmark"
    Then I should see "Makers Academy" in a link
