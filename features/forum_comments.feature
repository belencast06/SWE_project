# features/forum_comments.feature
Feature: Forum Comments
  As a user of the platform
  I want to be able to comment on forum posts
  So that I can participate in discussions

  Background:
    Given I am a registered user
    And I am logged in
    And there is a forum post with title "Test Post" and content "Test content"

  Scenario: Add a comment to a forum post
    When I visit the forum post
    And I fill in the comment form with "This is a test comment"
    And I click "Add Comment"
    Then I should see "Comment was successfully added."
    And I should see "This is a test comment"

  Scenario: Reply to a comment
    Given there is a comment "Original comment" on the forum post
    When I visit the forum post
    And I click "Reply" on "Original comment"
    And I fill in the reply form with "This is a reply"
    And I click "Submit Reply"
    Then I should see "Comment was successfully added."
    And I should see "This is a reply"

  Scenario: Delete my own comment
    Given I have created a comment "My comment" on the forum post
    When I visit the forum post
    And I click "Delete" on "My comment"
    Then I should see "Comment was deleted."
    And I should not see "My comment"