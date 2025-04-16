Then("I should see {string}") do |content|
  expect(page).to have_content(content)
end

When("I click on {string}") do |link_text|
  click_link link_text
end