Feature: Forum Management
  As a user,
  I want to be able to access forum categories from the homepage,
  view forum posts, create new ones, edit my existing ones, and
  delete them.


Scenario: View forum categories from homepage
  Given I am a logged in user
  When I visit the homepage
  Then I should see the "Forum" section
  And I should see the "General Discussion" link
  And I should see the "Help & Support" link
  And I should see the "Off-Topic" link


Scenario: Navigate to General Discussion from homepage
  Given I am a logged in user
  When I visit the homepage
  And I click on the "General Discussion" link
  Then I should see the "General Discussion" forum
  And I should see a list of posts in the forum


Scenario: Create a new forum post
  Given I am a logged in user
  When I visit the homepage
  And I click on the "General Discussion" link
  And I click on "New Post" button
  And I fill in "Title" with "Question about Ruby Classes"
  And I fill in "Content" with "How do I create a class that inherits from another?"
  And I click on "Create Post" button
  Then I should see "Post was successfully created"
  And I should see my post with title "Question about Ruby Classes" in the list


Scenario: Edit my existing forum post
  Given I am a logged in user
  And I have created a post with title "Post to Edit" in the "General Discussion" category
  When I visit the homepage
  And I click on the "General Discussion" link
  And I click on the "Edit" link for "Post to Edit"
  And I fill in "Content" with "This is my updated content"
  And I click on "Update Post" button
  Then I should see "Post was successfully updated"
  And I should see my post with updated content "This is my updated content"


Scenario: Delete my forum post
  Given I am a logged in user
  And I have created a post with title "Post to Delete" in the "Help & Support" category
  When I visit the homepage
  And I click on the "Help & Support" link
  And I click on the "Delete" link for "Post to Delete"
  And I confirm the deletion
  Then I should see "Post was successfully deleted"
  And I should not see "Post to Delete" in the list
  

Scenario: Cannot edit another user's post
  Given I am a logged in user with username "user1"
  And another user with username "user2" has created a post with title "Another User's Post" in the "Off-Topic" category
  When I visit the homepage
  And I click on the "Off-Topic" link
  Then I should not see an "Edit" link for "Another User's Post"
  
  
Scenario: Search for posts across all categories
  Given I am a logged in user
  And there are posts containing "Ruby" in different categories
  When I visit the homepage
  And I click on the "Forum" section
  And I fill in "Search" with "Ruby"
  And I click on "Search" button
  Then I should only see posts containing "Ruby" from all categories