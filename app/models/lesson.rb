class Lesson < ApplicationRecord
  # Add this line to associate a lesson with many content pages
  has_many :content_pages, dependent: :destroy
  has_many :assessment_pages, dependent: :destroy
end
