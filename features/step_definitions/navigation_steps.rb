# features/step_definitions/navigation_steps.rb
Then("I should see the following navigation options:") do |table|
  table.raw.flatten.each do |option|
    expect(page).to have_content(option)
  end
end

Then("I should be on the home page") do
  expect(page).to have_current_path(home_path)
end

Then("I should be on the general discussion page") do
  expect(page).to have_current_path(general_discussion_path)
end

Then("I should be on the help and support page") do
  expect(page).to have_current_path(help_support_path)
end

Then("I should be on the off topic page") do
  expect(page).to have_current_path(off_topic_path)
end


Then("I should see {string} in the navigation bar") do |text|
  within('nav') do
    expect(page).to have_content(text)
  end
end

When("I click on the site logo") do
  within('nav') do
    find('.navbar-brand').click
  end
end

When("I visit a lesson page") do
  visit home_path
  
  # Look for "Go to lesson" link and click the first one
  first('a', text: "Go to lesson").click
  
  # Now we should be on a lesson page like "Intro to C++"
  # If the test needs to go further, we can add:
  first('a', text: "View this section").click
end

When("I try to visit the home page") do
  visit home_path
end

When("I try to visit the {string} forum") do |forum|
  case forum
  when "General Discussion"
    visit general_discussion_path
  when "Help & Support"
    visit help_support_path
  when "Off-Topic"
    visit off_topic_path
  end
end

When("I try to visit a lesson page") do
  visit lessons_path
end