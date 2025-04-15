Feature: Off-Topic Forum

  Background:
    Given I am a logged-in user
    And I am on the Home page

  Scenario: View empty Off-Topic section
    When I click on the "Off-Topic" link
    Then I should see "No posts in this category yet"

  Scenario: Create a new post
    When I click on the "Off-Topic" link
    And I click the "Create New Post" button
    And I fill in the post form with title "Random Thoughts" and content "Anyone else binge-watching coding videos?"
    And I submit the form
    Then I should see the post titled "Random Thoughts" in the forum

  Scenario: View all posts in the Off-Topic section
    Given there are forum posts titled "Random Thoughts", "Weekend Plans", and "Favorite Memes" in the Off-Topic section
    When I click on the "Off-Topic" link
    Then I should see the post titled "Random Thoughts"
    And I should see the post titled "Weekend Plans"
    And I should see the post titled "Favorite Memes"

  Scenario: View a specific post in the Off-Topic section
    Given there is a post titled "Favorite Memes" with content "Post your funniest programming memes here." in the Off-Topic section
    When I click on the "Off-Topic" link
    And I click on the post titled "Favorite Memes"
    Then I should see "Favorite Memes"
    And I should see "Post your funniest programming memes here."

  Scenario: Navigate back to Home from Off-Topic
    When I click on the "Off-Topic" link
    And I click the "Back to Home" button
    Then I should be on the Home page