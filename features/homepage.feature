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

  Scenario: Adding a link with two tags
    Given I am on the homepage
    When I fill in the "title" with "Makers Academy"
    And I fill in the "url" with "https://www.makersacademy.com"
    And I fill in the "tag" with "codeschool, learning course"
    And I click "Add Bookmark"
    Then I should see "codeschool"
    And I should see "learning course"



  Scenario: sorting all links
    Given I have three links and two of the links with the tag 'search'
    When I press the "search" tag
    Then I should see a page with only the links associated with that tag