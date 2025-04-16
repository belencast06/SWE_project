# features/step_definitions/authentication_steps.rb

# Navigation steps
Given("I am on the signup page") do
  visit signup_path
end

Given("I am on the login page") do
  visit login_path
end

Given("the login page is displayed") do
  visit login_path
end

Given("I am on the Home page") do
  visit home_path
end

# Form interaction steps
When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click the {string} button") do |button_text|
  click_button button_text
end

When("I click the {string} link") do |link_text|
  click_link link_text
end

# User creation and login steps
Given("there is a registered user with email {string} and password {string}") do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Given("I am a registered user") do
  @user = User.create!(
    email: "test@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

Given("I am logged in") do
  # First create a user if it doesn't exist yet
  @user ||= User.create!(
    email: "test@example.com",
    password: "password",
    password_confirmation: "password"
  )
  
  # Then log in
  visit login_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: "password"
  click_button "Log In"
end

Given("I am a logged-in user") do
  @test_user = User.find_or_create_by!(email: "testuser@example.com") do |user|
    user.password = "password123"
    user.password_confirmation = "password123"
  end

  visit login_path
  fill_in "Email", with: @test_user.email
  fill_in "Password", with: "password123"
  click_button "Log In"
end

Given("I am not logged in") do
  # Ensure the user is logged out
  visit logout_path if page.has_link?("Logout")
end

# Access and redirection steps
When("I try to access protected content") do
  visit home_path
end

Then("I should not be able to access protected content") do
  visit home_path
  expect(page).to have_current_path(login_path)
end

Then("I should be redirected to the Home page") do
  expect(current_path).to eq(home_path)
end

Then("I should be redirected to the login page") do
  expect(page).to have_current_path(login_path)
end

Then("I should be redirected back to the login page") do
  expect(current_path).to eq(login_path)
end

Then("I should be on the sign-up page") do
  expect(current_path).to eq(signup_path)
end

# Error and validation steps
Then("I should see an error message") do
  # Check various possible ways errors could be displayed
  expect(page).to have_css(".alert-danger") || 
                 have_css(".alert") || 
                 have_content("failed") ||
                 have_content("error") ||
                 have_css(".field_with_errors")
end