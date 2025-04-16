# spec/models/forum_post_spec.rb
require 'rails_helper'

RSpec.describe ForumPost, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  
  describe "validations" do
    it "is valid with valid attributes" do
      post = ForumPost.new(
        title: "Test Post",
        content: "This is a test post",
        category: "general",
        user: user
      )
      expect(post).to be_valid
    end
    
    it "is not valid without a title" do
      post = ForumPost.new(
        title: nil,
        content: "This is a test post",
        category: "general",
        user: user
      )
      expect(post).not_to be_valid
    end
    
    it "is not valid without content" do
      post = ForumPost.new(
        title: "Test Post",
        content: nil,
        category: "general",
        user: user
      )
      expect(post).not_to be_valid
    end
    
    it "is not valid without a category" do
      post = ForumPost.new(
        title: "Test Post",
        content: "This is a test post",
        category: nil,
        user: user
      )
      expect(post).not_to be_valid
    end
  end
  
  describe "associations" do
    it "belongs to a user" do
      association = ForumPost.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    
    it "has many comments" do
      association = ForumPost.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
  end
  
  describe "#top_level_comments" do
    it "returns only top-level comments" do
      post = ForumPost.create(
        title: "Test Post",
        content: "This is a test post",
        category: "general",
        user: user
      )
      
      top_comment = Comment.create(
        content: "Top-level comment",
        forum_post: post,
        user: user
      )
      
      reply = Comment.create(
        content: "Reply to comment",
        forum_post: post,
        user: user,
        parent_comment: top_comment
      )
      
      expect(post.top_level_comments).to include(top_comment)
      expect(post.top_level_comments).not_to include(reply)
    end
  end
end