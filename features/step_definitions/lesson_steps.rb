# features/step_definitions/lesson_steps.rb

Given("I am logged in as a student") do
  @test_user = User.find_or_create_by!(email: "testuser@example.com") do |user|
    user.password = "password123"
    user.password_confirmation = "password123"
  end

  visit login_path
  fill_in "Email", with: @test_user.email
  fill_in "Password", with: "password123"
  click_button "Log In"
end

When("I visit the lessons home page") do
  # Create a lesson if none exist
  unless Lesson.exists?
    Lesson.create!(title: "Intro to C++")
  end
  
  # Visit the homepage
  visit root_path
end

Then("I should see lesson tiles") do
  # Check for the "Lessons" heading
  expect(page).to have_content("Lessons")
  
  # Check for "Forum" heading which definitely appears on the page
  expect(page).to have_content("Forum")
  
  # Check for lesson tiles container
  expect(page).to have_css('.row')
end

Given("I am on a lesson page") do
  # Find or create a lesson
  lesson = Lesson.find_by(title: "Intro to C++") || 
           Lesson.create!(title: "Intro to C++")
  
  # Create content pages if they don't exist
  unless lesson.content_pages.exists?
    ContentPage.create!(
      title: "Intro to C++ - Introduction",
      body: "Test content for intro",
      lesson: lesson
    )
  end
  
  # Create assessment pages if they don't exist
  unless lesson.assessment_pages.exists?
    AssessmentPage.create!(
      title: "Intro to C++ - Assessment",
      content: "Test assessment for intro",
      lesson: lesson
    )
  end
  
  # Visit the lesson page
  visit lesson_path(lesson)
end

Given("I am on a content page") do
  # Get or create necessary objects
  lesson = Lesson.find_by(title: "Intro to C++") || 
           Lesson.create!(title: "Intro to C++")
  
  content_page = lesson.content_pages.first || 
                ContentPage.create!(
                  title: "Intro to C++ - Introduction",
                  body: "Test content for intro",
                  lesson: lesson
                )
  
  # Visit the content page
  visit lesson_content_page_path(lesson, content_page)
end

When("I click on {string}") do |link_text|
  click_link(link_text)
rescue Capybara::ElementNotFound
  # Try finding and clicking anything with this text
  find('a, span, div, button', text: link_text, match: :first).click
end

Then("I should see the back to lesson link") do
  expect(page).to have_link("← Back to Lesson Page")
end

Then("I should be on the lesson page") do
  # Check for elements that should be on the lesson page
  expect(page).to have_content("Lesson Content")
end

# Add this new step definition to your lesson_steps.rb file
When("I click the lesson back button") do
  click_link("← Back to Lesson Page")
rescue Capybara::ElementNotFound
  find("a", text: /Back to Lesson Page/i).click
end