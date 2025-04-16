require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end
    
    it "is not valid without an email" do
      user = User.new(email: nil, password: "password", password_confirmation: "password")
      expect(user).not_to be_valid
    end
    
    it "is not valid with an invalid email format" do
      user = User.new(email: "invalid_email", password: "password", password_confirmation: "password")
      expect(user).not_to be_valid
    end
    
    it "is not valid without a password" do
      user = User.new(email: "test@example.com", password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
    end
    
    it "is not valid with a password less than 6 characters" do
      user = User.new(email: "test@example.com", password: "short", password_confirmation: "short")
      expect(user).not_to be_valid
    end
    
    it "is not valid when password and confirmation don't match" do
      user = User.new(email: "test@example.com", password: "password", password_confirmation: "different")
      expect(user).not_to be_valid
    end
    
    it "is not valid with a duplicate email" do
      User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
      duplicate_user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(duplicate_user).not_to be_valid
    end
  end
  
  describe "associations" do
    it "has many forum posts" do
      association = User.reflect_on_association(:forum_posts)
      expect(association.macro).to eq :has_many
    end
    
    it "has many comments" do
      association = User.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
  end
  
  describe "password encryption" do
    it "doesn't store the plain password" do
      user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(user.password_digest).not_to eq "password"
    end
    
    it "can authenticate with correct password" do
      user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(user.authenticate("password")).to eq user
    end
    
    it "cannot authenticate with incorrect password" do
      user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(user.authenticate("wrong_password")).to be false
    end
  end
end