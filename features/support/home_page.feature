Feature: Home Page

  Background:
    Given I am a logged-in user

  Scenario: View all lesson cards
    When I visit the Home page
    Then I should see lessons:
      | Intro to C++ |
      | Expressions  |
      | Loops        |
      | Classes      |
      | Vectors      |
      | Variables    |
      | Conditionals |
      | Functions    |
      | Arrays       |
      | Pointers     |

  Scenario: View all forum sections
    When I visit the Home page
    Then I should see forum sections:
      | General Discussion |
      | Help & Support     |
      | Off-Topic          |