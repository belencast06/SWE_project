class User < ApplicationRecord
  has_secure_password

  has_many :forum_posts
  has_many :comments
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
end