Feature: General Discussion Forum

  Background:
    Given I am a logged-in user
    And I am on the Home page

  Scenario: View empty General Discussion section
    When I click on the "General Discussion" link
    Then I should see "No posts in this category yet"

  Scenario: Create a new post
    When I click on the "General Discussion" link
    And I click the "Create New Post" button
    And I fill in the post form with title "Welcome" and content "Excited to join!"
    And I submit the form
    Then I should see the post titled "Welcome" in the forum

  Scenario: View all posts in the General Discussion section
    Given there are forum posts titled "Welcome", "Getting Started", and "Introduce Yourself" in the General Discussion section
    When I click on the "General Discussion" link
    Then I should see the post titled "Welcome"
    And I should see the post titled "Getting Started"
    And I should see the post titled "Introduce Yourself"

  Scenario: View a specific post in the General Discussion section
    Given there is a post titled "Welcome" with content "Excited to join!" in the General Discussion section
    When I click on the "General Discussion" link
    And I click on the post titled "Welcome"
    Then I should see "Welcome"
    And I should see "Excited to join!"

    Scenario: Return to Home from General Discussion
    When I click on the "General Discussion" link
    And I click the "Back to Home" button
    Then I should be on the Home page