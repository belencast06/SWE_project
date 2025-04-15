When("I click on the {string} lesson card") do |lesson_title|
  click_link(lesson_title)
end

When("I click on {string}") do |link_text|
  click_link(link_text)
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should see lesson content for {string}") do |section_title|
  expect(page).to have_content(section_title)
  # Optionally check for more specific lesson-related content structure
end

Then("I should see the assessment page for {string}") do |lesson_title|
  expect(page).to have_content("#{lesson_title} - Assessment")
  expect(page).to have_content("Start the quiz").or have_button("Submit") # Based on your UI
end
