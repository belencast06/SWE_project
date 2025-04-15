When("I click on the {string} link") do |link_text|
  click_link(link_text)
end

When("I click the {string} button") do |button_text|
  click_button(button_text)
end

When("I fill in the post form with title {string} and content {string}") do |title, content|
  fill_in "Title", with: title
  fill_in "Content", with: content
end

When("I submit the form") do
  click_button("Create Post")
end

Then("I should see the post titled {string} in the forum") do |title|
  expect(page).to have_content(title)
end

Given("there are forum posts titled {string}, {string}, and {string} in the Off-Topic section") do |t1, t2, t3|
  [t1, t2, t3].each do |title|
    ForumPost.create!(title: title, content: "Sample content", category: "Off-Topic")
  end
end

Given("there is a post titled {string} with content {string} in the Off-Topic section") do |title, content|
  ForumPost.create!(title: title, content: content, category: "Off-Topic")
end

Then("I should see the post titled {string}") do |title|
  expect(page).to have_content(title)
end

When("I click on the post titled {string}") do |title|
  click_link(title)
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should be on the Home page") do
  expect(current_path).to eq(home_path)
end
