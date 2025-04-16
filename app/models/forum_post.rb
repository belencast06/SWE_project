# app/models/forum_post.rb
class ForumPost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  
  # Get only top-level comments
  def top_level_comments
    comments.top_level
  end
end