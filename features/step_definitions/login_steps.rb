Given("the login page is displayed") do
  visit login_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click the {string} button") do |button_text|
  click_button button_text
end

When("I click the {string} link") do |link_text|
  click_link link_text
end

Then("I should be redirected to the Home page") do
  expect(current_path).to eq(home_path)
end

Then("I should see {string}") do |message|
  expect(page).to have_content(message)
end

Then("I should be redirected back to the login page") do
  expect(current_path).to eq(login_path)
end

Then("I should be on the sign-up page") do
  expect(current_path).to eq(signup_path)
end
