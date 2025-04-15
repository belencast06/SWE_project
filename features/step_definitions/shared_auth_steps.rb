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

Given("I am on the Home page") do
  visit home_path
end
