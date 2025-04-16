Given("I am on the signup page") do
  visit signup_path
end

Given("I am on the login page") do
  visit login_path
end

Given("there is a registered user with email {string} and password {string}") do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Then("I should not be able to access protected content") do
  visit home_path
  expect(page).to have_current_path(login_path)
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
  
  # Click the Log In button (matches your actual form submit button text)
  click_button "Log In"
end

Then("I should see an error message") do
  expect(page).to have_css(".alert-danger") || have_css(".alert-error") || have_css(".alert")
end

Given("I am not logged in") do
  # Ensure the user is logged out
  visit logout_path if page.has_link?("Logout")
end

When("I try to access protected content") do
  visit home_path
end

Then("I should be redirected to the login page") do
  expect(page).to have_current_path(login_path)
end