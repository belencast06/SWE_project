# spec/routing/navigation_routing_spec.rb
require "rails_helper"

RSpec.describe "Navigation Routes", type: :routing do
  it "routes / to home#index" do
    expect(get: "/").to route_to("home#index")
  end
  
  it "routes /home to home#index" do
    expect(get: "/home").to route_to("home#index")
  end
  
  it "routes /forum/general_discussion to forum_posts#index" do
    expect(get: "/forum/general_discussion").to route_to(
      controller: "forum_posts",
      action: "index",
      category: "general"
    )
  end
  
  it "routes /forum/help_support to forum_posts#index" do
    expect(get: "/forum/help_support").to route_to(
      controller: "forum_posts",
      action: "index",
      category: "help"
    )
  end
  
  it "routes /forum/off_topic to forum_posts#index" do
    expect(get: "/forum/off_topic").to route_to(
      controller: "forum_posts",
      action: "index",
      category: "offtopic"
    )
  end
  
  it "routes /login to sessions#new" do
    expect(get: "/login").to route_to("sessions#new")
  end
  
  it "routes /logout to sessions#destroy" do
    expect(get: "/logout").to route_to("sessions#destroy")
  end
  
  it "routes /signup to users#new" do
    expect(get: "/signup").to route_to("users#new")
  end
  
  it "routes /lessons to lessons#index" do
    expect(get: "/lessons").to route_to("lessons#index")
  end
end