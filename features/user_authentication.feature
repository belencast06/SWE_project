Feature: User Authentication
  As a user
  I want to be able to sign up, log in, and log out
  So that I can access protected content

  Scenario: User signs up successfully
    Given I am on the signup page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "password"
    And I click "Create Account"
    Then I should see "Welcome"

  Scenario: User tries to sign up with invalid email
    Given I am on the signup page
    When I fill in "Email" with "invalid-email"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "password"
    And I click "Create Account"
    Then I should see an error message

  Scenario: User tries to sign up with mismatched passwords
    Given I am on the signup page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "different"
    And I click "Create Account"
    Then I should see an error message

  Scenario: User tries to sign up with too short password
    Given I am on the signup page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "short"
    And I fill in "Confirm Password" with "short"
    And I click "Create Account"
    Then I should see an error message

  Scenario: User logs in successfully
    Given there is a registered user with email "test@example.com" and password "password"
    And I am on the login page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password"
    And I click button "Log In"
    Then I should see "Welcome"

  Scenario: User tries to log in with incorrect password
    Given there is a registered user with email "test@example.com" and password "password"
    And I am on the login page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "wrong_password"
    And I click button "Log In"
    Then I should see an error message
    And I should not be able to access protected content

  Scenario: User tries to log in with non-existent email
    Given I am on the login page
    When I fill in "Email" with "nonexistent@example.com"
    And I fill in "Password" with "password"
    And I click button "Log In"
    Then I should see an error message
    And I should not be able to access protected content

  Scenario: User logs out
    Given I am logged in
    When I click "Logout"
    Then I should see "Log In"
    And I should not be able to access protected content

  Scenario: User tries to access protected content without logging in
    Given I am not logged in
    When I try to access protected content
    Then I should be redirected to the login page