When("I visit the Home page") do
  visit home_path
end

Then("I should see lessons:") do |table|
  table.raw.flatten.each do |lesson_title|
    expect(page).to have_content(lesson_title)
  end
end

Then("I should see forum sections:") do |table|
  table.raw.flatten.each do |section_name|
    expect(page).to have_content(section_name)
  end
end
