# features/forum_posts.feature
Feature: Forum Posts
  As a user of the platform
  I want to be able to create and view forum posts
  So that I can participate in discussions

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: View forum categories
    When I visit the home page
    Then I should see the forum categories
    And I should see "General Discussion"
    And I should see "Help & Support"
    And I should see "Off-Topic"

  Scenario: Create a new forum post
    When I visit the "General Discussion" forum
    And I click "Create New Post"
    Then I should see the new post form
    When I fill in "Title" with "Test Post Title"
    And I fill in "Content" with "This is a test post content."
    And I click "Create Post"
    Then I should see "Post created successfully!"
    And I should see "Test Post Title"

  Scenario: View a forum post
    Given there is a forum post with title "Existing Post" and content "This is an existing post."
    When I visit the "General Discussion" forum
    And I click on forum post "Existing Post"
    Then I should see "Existing Post"
    And I should see "This is an existing post."

  Scenario: Delete my own forum post
    Given I have created a forum post with title "My Post" and content "This is my post."
    When I visit my forum post
    And I click "Delete Post"
    Then I should see "Post deleted successfully!"