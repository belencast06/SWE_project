# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :forum_post
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id', dependent: :destroy
  
  validates :content, presence: true
  
  # Get top-level comments for a post
  scope :top_level, -> { where(parent_comment_id: nil) }
  
  # Sort by newest first
  default_scope { order(created_at: :desc) }
end