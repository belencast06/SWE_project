Then("I should see links for {string}, {string}, and {string}") do |link1, link2, link3|
  [link1, link2, link3].each do |forum_link|
    expect(page).to have_link(forum_link)
  end
end
