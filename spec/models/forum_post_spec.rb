# spec/models/forum_post_spec.rb
require 'rails_helper'

RSpec.describe ForumPost, type: :model do
  # Set up a valid forum post for testing
  let(:user) { User.create(username: "testuser", email: "test@example.com", password: "password") }
  let(:category) { ForumCategory.create(name: "General Discussion") }
  let(:valid_post) { ForumPost.new(title: "Test Post", content: "This is test content", user: user, forum_category: category) }

  # Test that a valid post can be created
  it "is valid with valid attributes" do
    expect(valid_post).to be_valid
  end

  # Association tests
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:forum_category) }
  end

  # Validation tests
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    
    it "is not valid without a title" do
      post = ForumPost.new(title: nil, content: "Content", user: user, forum_category: category)
      expect(post).not_to be_valid
    end
    
    it "is not valid without content" do
      post = ForumPost.new(title: "Title", content: nil, user: user, forum_category: category)
      expect(post).not_to be_valid
    end
    
    it "is not valid without a user" do
      post = ForumPost.new(title: "Title", content: "Content", user: nil, forum_category: category)
      expect(post).not_to be_valid
    end
    
    it "is not valid without a category" do
      post = ForumPost.new(title: "Title", content: "Content", user: user, forum_category: nil)
      expect(post).not_to be_valid
    end
  end

  # Method tests
  describe "#recent" do
    it "returns posts from the last week" do
      # Create older post
      old_post = ForumPost.create(
        title: "Old Post",
        content: "Old content",
        user: user,
        forum_category: category,
        created_at: 2.weeks.ago
      )
      
      # Create recent post
      new_post = ForumPost.create(
        title: "New Post",
        content: "New content",
        user: user,
        forum_category: category,
        created_at: 2.days.ago
      )
      
      # Test the recent method (assuming you have this method in your model)
      expect(ForumPost.recent).to include(new_post)
      expect(ForumPost.recent).not_to include(old_post)
    end
  end
  
  # Test for search functionality
  describe ".search" do
    before do
      @ruby_post = ForumPost.create(
        title: "Ruby Programming",
        content: "Learning Ruby is fun",
        user: user,
        forum_category: category
      )
      
      @python_post = ForumPost.create(
        title: "Python Tips",
        content: "Python is also great",
        user: user,
        forum_category: category
      )
    end
    
    it "returns posts that match the search term in title" do
      results = ForumPost.search("Ruby")
      expect(results).to include(@ruby_post)
      expect(results).not_to include(@python_post)
    end
    
    it "returns posts that match the search term in content" do
      results = ForumPost.search("great")
      expect(results).to include(@python_post)
      expect(results).not_to include(@ruby_post)
    end
    
    it "returns no results when no matches found" do
      results = ForumPost.search("JavaScript")
      expect(results).to be_empty
    end
  end
end