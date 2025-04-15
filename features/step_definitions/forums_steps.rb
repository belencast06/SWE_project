# features/step_definitions/forums_steps.rb
#random edit for test
# User login steps
Given("I am a logged in user") do
  @user = User.create!(username: "testuser", email: "test@example.com", password: "password")
  visit login_path
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end


Given("I am a logged in user with username {string}") do |username|
  @user = User.create!(username: username, email: "#{username}@example.com", password: "password")
  visit login_path
  fill_in "Email", with: "#{username}@example.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end


# Navigation steps
When("I visit the homepage") do
  visit root_path
end


Then("I should see the {string} section") do |section_name|
  expect(page).to have_content(section_name)
end


Then("I should see the {string} link") do |link_name|
  expect(page).to have_link(link_name)
end


When("I click on the {string} link") do |link_name|
  click_link link_name
end


Then("I should see the {string} forum") do |forum_name|
  expect(page).to have_content(forum_name)
end


# Forum post creation and interaction steps
When("I click on {string} button") do |button_name|
  click_button button_name
end


When("I click on the {string} link for {string}") do |link_name, post_title|
  within(:xpath, "//div[contains(., '#{post_title}')]") do
    click_link link_name
  end
end


When("I fill in {string} with {string}") do |field_name, value|
  fill_in field_name, with: value
end


# Verification steps
Then("I should see a list of posts in the forum") do
  expect(page).to have_css(".forum-post, .post, article, .post-item")
end


Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end


Then("I should see my post with title {string} in the list") do |title|
  expect(page).to have_content(title)
end


Then("I should see my post with updated content {string}") do |content|
  expect(page).to have_content(content)
end


Then("I should not see {string} in the list") do |content|
  expect(page).not_to have_content(content)
end


# Post creation setup for testing
Given("I have created a post with title {string} in the {string} category") do |title, category_name|
  category = ForumCategory.find_by(name: category_name) || 
             ForumCategory.create!(name: category_name)
  
  @post = ForumPost.create!(
    title: title,
    content: "Test content for #{title}",
    user: @user,
    forum_category: category
  )
end


Given("another user with username {string} has created a post with title {string} in the {string} category") do |username, title, category_name|
  other_user = User.create!(username: username, email: "#{username}@example.com", password: "password")
  
  category = ForumCategory.find_by(name: category_name) || 
             ForumCategory.create!(name: category_name)
  
  ForumPost.create!(
    title: title,
    content: "This post belongs to another user",
    user: other_user,
    forum_category: category
  )
end


Then("I should not see an {string} link for {string}") do |link_name, post_title|
  within(:xpath, "//div[contains(., '#{post_title}')]") do
    expect(page).not_to have_link(link_name)
  end
end


When("I confirm the deletion") do
  # This depends on how you've implemented deletion confirmation
  # For a JavaScript confirmation dialog:
  page.driver.browser.switch_to.alert.accept
  # For a confirmation page:
  # click_button "Confirm"
end


# Search functionality
Given("there are posts containing {string} in different categories") do |search_term|
  user = @user || User.create!(username: "searchuser", email: "search@example.com", password: "password")
  
  # Create categories if they don't exist
  general = ForumCategory.find_by(name: "General Discussion") || 
            ForumCategory.create!(name: "General Discussion")
  
  help = ForumCategory.find_by(name: "Help & Support") || 
         ForumCategory.create!(name: "Help & Support")
  
  offtopic = ForumCategory.find_by(name: "Off-Topic") || 
             ForumCategory.create!(name: "Off-Topic")
  
  # Create posts with the search term in different categories
  ForumPost.create!(
    title: "#{search_term} Programming",
    content: "Discussion about #{search_term} language",
    user: user,
    forum_category: general
  )
  
  ForumPost.create!(
    title: "Help with #{search_term}",
    content: "I need help with #{search_term}",
    user: user,
    forum_category: help
  )
  
  ForumPost.create!(
    title: "#{search_term} memes",
    content: "Funny #{search_term} memes",
    user: user,
    forum_category: offtopic
  )
  
  # Create posts without the search term
  ForumPost.create!(
    title: "Python Tips",
    content: "Tips for Python developers",
    user: user,
    forum_category: general
  )
end


Then("I should only see posts containing {string} from all categories") do |search_term|
  # Should see posts with the search term
  ForumPost.where("title LIKE ? OR content LIKE ?", "%#{search_term}%", "%#{search_term}%").each do |post|
    expect(page).to have_content(post.title)
  end
  
  
  # Should not see posts without the search term
  ForumPost.where.not("title LIKE ? OR content LIKE ?", "%#{search_term}%", "%#{search_term}%").each do |post|
    expect(page).not_to have_content(post.title)
  end
end