Feature: Help & Support Forum

  Background:
    Given I am a logged-in user
    And I am on the Home page

  Scenario: View empty Help & Support section
    When I click on the "Help & Support" link
    Then I should see "No posts in this category yet"

  Scenario: Create a new post
    When I click on the "Help & Support" link
    And I click the "Create New Post" button
    And I fill in the post form with title "Need help with login" and content "I can’t access my account."
    And I submit the form
    Then I should see the post titled "Need help with login" in the forum

  Scenario: View all posts in the Help & Support section
    Given there are forum posts titled "Need help with login", "Page not loading", and "Assessment not submitting" in the Help & Support section
    When I click on the "Help & Support" link
    Then I should see the post titled "Need help with login"
    And I should see the post titled "Page not loading"
    And I should see the post titled "Assessment not submitting"

  Scenario: View a specific post in the Help & Support section
    Given there is a post titled "Page not loading" with content "The lessons page keeps crashing." in the Help & Support section
    When I click on the "Help & Support" link
    And I click on the post titled "Page not loading"
    Then I should see "Page not loading"
    And I should see "The lessons page keeps crashing."

  Scenario: Navigate back to Home from Help & Support
    When I click on the "Help & Support" link
    And I click the "Back to Home" button
    Then I should be on the Home page