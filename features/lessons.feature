# features/lessons.feature
Feature: Lessons
  As a student
  I want to access and navigate through lessons
  So that I can learn the course material

  Background:
    Given I am logged in as a student

  Scenario: View available lessons on home page
    When I visit the lessons home page
    Then I should see lesson tiles

  Scenario: View a lesson page directly
    Given I am on a lesson page
    Then I should see "Lesson Content"

  Scenario: View a content page directly
    Given I am on a content page
    Then I should see the back to lesson link

  Scenario: Return to lesson from content page
    Given I am on a content page
    When I click the lesson back button
    Then I should be on the lesson page