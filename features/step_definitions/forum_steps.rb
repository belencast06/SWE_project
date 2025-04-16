When("I visit the home page") do
  visit home_path
end

Then("I should see the forum categories") do
  expect(page).to have_content("Forum")
end

# features/step_definitions/forum_steps.rb
When("I visit the {string} forum") do |category|
  case category
  when "General Discussion"
    visit general_discussion_path
  when "Help & Support"
    visit help_support_path
  when "Off-Topic"
    visit off_topic_path
  end
end

Then("I should see the new post form") do
  expect(page).to have_content("Create New Post")
  expect(page).to have_field("Title")
  expect(page).to have_field("Content")
end

When("I click {string}") do |link_text|
  click_link_or_button link_text
end

Given("there is a forum post with title {string} and content {string}") do |title, content|
  @forum_post = ForumPost.create!(
    title: title,
    content: content,
    category: "general",
    user: @user
  )
end

Given("I have created a forum post with title {string} and content {string}") do |title, content|
  @my_post = ForumPost.create!(
    title: title,
    content: content,
    category: "general",
    user: @user
  )
end

When("I visit my forum post") do
  visit forum_post_path(@my_post)
end

When("I visit the forum post") do
  visit forum_post_path(@forum_post)
end

When("I click button {string}") do |button_text|
  click_button button_text
end

When("I fill in the comment form with {string}") do |content|
  fill_in "Write a comment...", with: content
end

Given("there is a comment {string} on the forum post") do |content|
  @comment = Comment.create!(
    content: content,
    forum_post: @forum_post,
    user: @user
  )
end

When("I click {string} on {string}") do |button_text, comment_content|
  within(find(".comment", text: comment_content)) do
    click_link_or_button button_text
  end
end

When("I fill in the reply form with {string}") do |content|
  fill_in "Write your reply...", with: content
end

Given("I have created a comment {string} on the forum post") do |content|
  @my_comment = Comment.create!(
    content: content,
    forum_post: @forum_post,
    user: @user
  )
end

Then("I should not see {string}") do |content|
  expect(page).not_to have_content(content)
end

When("I click on forum post {string}") do |post_title|
  click_link(post_title)
rescue Capybara::ElementNotFound
  find('a, h2, h3, h4, h5', text: post_title, match: :first).click
end