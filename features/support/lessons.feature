Feature: Viewing a Lesson Page
  As a user
  I want to view a lesson
  So that I can access its content pages and assessments

  Background:
    Given a lesson exists with the title "Lesson 1" and content "Introduction to Lesson 1"
  
  Scenario: Viewing a lesson page
    When I visit the lesson page for "Lesson 1"
    Then I should see "Lesson 1"
    And I should see "Introduction to Lesson 1"

  Scenario: Viewing content pages of a lesson
    When I visit the lesson page for "Lesson 1"
    Then I should see a list of content pages

  Scenario: Viewing the assessment for a lesson
    When I visit the lesson page for "Lesson 1"
    Then I should see an assessment link
