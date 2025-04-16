# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  let(:forum_post) do
    ForumPost.create(
      title: "Test Post",
      content: "This is a test post",
      category: "general",
      user: user
    )
  end
  
  describe "validations" do
    it "is valid with valid attributes" do
      comment = Comment.new(
        content: "Test comment",
        forum_post: forum_post,
        user: user
      )
      expect(comment).to be_valid
    end
    
    it "is not valid without content" do
      comment = Comment.new(
        content: nil,
        forum_post: forum_post,
        user: user
      )
      expect(comment).not_to be_valid
    end
  end
  
  describe "associations" do
    it "belongs to a user" do
      association = Comment.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    
    it "belongs to a forum post" do
      association = Comment.reflect_on_association(:forum_post)
      expect(association.macro).to eq :belongs_to
    end
    
    it "can belong to a parent comment" do
      association = Comment.reflect_on_association(:parent_comment)
      expect(association.macro).to eq :belongs_to
      expect(association.options[:optional]).to eq true
    end
    
    it "has many replies" do
      association = Comment.reflect_on_association(:replies)
      expect(association.macro).to eq :has_many
    end
  end
  
  describe "scopes" do
    it "top_level scope returns only comments without a parent" do
      parent = Comment.create(
        content: "Parent comment",
        forum_post: forum_post,
        user: user
      )
      
      reply = Comment.create(
        content: "Reply to comment",
        forum_post: forum_post,
        user: user,
        parent_comment: parent
      )
      
      expect(Comment.top_level).to include(parent)
      expect(Comment.top_level).not_to include(reply)
    end
  end
end