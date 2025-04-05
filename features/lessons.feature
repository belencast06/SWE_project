Feature: Viewing a lesson show page
  As a user
  I want to view the lesson show page
  So that I can see its content and links to content/assessment pages

  Background:
    Given the database is seeded with lessons

  Scenario: Viewing Lesson 1's page as a logged-in user
    And I am logged in as a valid user
    When I visit the show page for "Lesson 1"
    Then I should see "Lesson 1"
    And I should see "Lesson 1 - Introduction"
    And I should see "Lesson 1 - Page 1"
    And I should see "Lesson 1 - Assessment"

    Scenario: Viewing Lesson 2's page
    When I visit the show page for "Lesson 2"
    Then I should see "Lesson 2"
    And I should see "Lesson 2 - Introduction"
    And I should see "Lesson 2 - Page 1"
    And I should see "Lesson 2 - Assessment"

  Scenario: Viewing Lesson 3's page
    When I visit the show page for "Lesson 3"
    Then I should see "Lesson 3"
    And I should see "Lesson 3 - Introduction"
    And I should see "Lesson 3 - Page 1"
    And I should see "Lesson 3 - Assessment"

    Scenario: Viewing Lesson 4's page
    When I visit the show page for "Lesson 4"
    Then I should see "Lesson 4"
    And I should see "Lesson 4 - Introduction"
    And I should see "Lesson 4 - Page 1"
    And I should see "Lesson 4 - Assessment"

    Scenario: Viewing Lesson 5's page
    When I visit the show page for "Lesson 5"
    Then I should see "Lesson 5"
    And I should see "Lesson 5 - Introduction"
    And I should see "Lesson 5 - Page 1"
    And I should see "Lesson 5 - Assessment"

  Scenario: Attempting to view a lesson without logging in
    When I visit the show page for "Lesson 1"
    Then I should be redirected to the login page
    And I should see "Login"