Given("a user exists with email {string} and password {string}") do |email, password|
  User.create(email: email, password: password, password_confirmation: password)
end

When("I visit the login page") do
  visit login_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click {string}") do |button_text|
  click_button button_text
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Given("I am logged in as {string}") do |email|
  user = User.find_by(email: email)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: "password123"
  click_button "Log in"
end
