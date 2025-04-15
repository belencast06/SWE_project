Feature: Intro to C++ Lesson - Lesson Feature 

  Background:
    Given I am a logged-in user
    And I am on the Home page

  Scenario: Navigate to the Intro to C++ lesson
    When I click on the "Intro to C++" lesson card
    Then I should see "Intro to C++ - Introduction"
    And I should see "Intro to C++ - Assessment"

  Scenario: View content section of Intro to C++
    When I click on the "Intro to C++" lesson card
    And I click on "View this section"
    Then I should see lesson content for "Intro to C++ - Introduction"

  Scenario: Start assessment for Intro to C++
    When I click on the "Intro to C++" lesson card
    And I click on "Start the quiz"
    Then I should see the assessment page for "Intro to C++"