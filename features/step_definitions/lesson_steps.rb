Given("a lesson exists with the title {string} and content {string}") do |title, content|
  @lesson = Lesson.create(title: title, content: content)
end

When("I visit the lesson page for {string}") do |title|
  lesson = Lesson.find_by(title: title)
  visit lesson_path(lesson)
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should see a list of content pages") do
  expect(page).to have_css("ul li", minimum: 1) # Checks if at least one list item exists
end

Then("I should see an assessment link") do
  expect(page).to have_link("Assessment")
end
