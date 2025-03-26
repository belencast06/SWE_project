Feature: User Login
  As a user
  I want to log into my account
  So that I can access my lessons and assessments

  Background:
    Given a user exists with email "test@example.com" and password "password123"

  Scenario: Successful login
    When I visit the login page
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password123"
    And I click "Log in"
    Then I should see "Welcome, test@example.com!"

  Scenario: Unsuccessful login with incorrect password
    When I visit the login page
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "wrongpassword"
    And I click "Log in"
    Then I should see "Invalid email or password"

  Scenario: Unsuccessful login with non-existent user
    When I visit the login page
    And I fill in "Email" with "nonexistent@example.com"
    And I fill in "Password" with "password123"
    And I click "Log in"
    Then I should see "Invalid email or password"

  Scenario: Logging out
    Given I am logged in as "test@example.com"
    When I click "Logout"
    Then I should see "You have been logged out"
