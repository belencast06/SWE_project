Feature: Forum

  Background:
    Given I am a logged-in user
    And I am on the Home page


Scenario: Each forum section is visible on the Home page
  Then I should see links for "General Discussion", "Help & Support", and "Off-Topic"