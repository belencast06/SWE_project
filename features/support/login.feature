Feature: User Login

  Background:
    Given the login page is displayed

  Scenario: Log in with valid credentials
    When I fill in "Email" with "castellanosbelen3@gmail.com"
    And I fill in "Password" with "securepassword"
    And I click the "Log In" button
    Then I should be redirected to the Home page
    And I should see "Welcome, castellanosbelen3@gmail.com!"

  Scenario: Log in with invalid credentials
    When I fill in "Email" with "wronguser@example.com"
    And I fill in "Password" with "wrongpassword"
    And I click the "Log In" button
    Then I should be redirected back to the login page

  Scenario: Navigate to sign-up page from login screen
    When I click the "Sign Up" link
    Then I should be on the sign-up page