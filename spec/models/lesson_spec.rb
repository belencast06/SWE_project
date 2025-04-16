# spec/models/lesson_spec.rb
require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe "associations" do
    it "has many content pages" do
      association = Lesson.reflect_on_association(:content_pages)
      expect(association.macro).to eq :has_many
    end
    
    it "has many assessment pages" do
      association = Lesson.reflect_on_association(:assessment_pages)
      expect(association.macro).to eq :has_many
    end
    
    it "destroys dependent content pages when deleted" do
      lesson = Lesson.create!(title: "Test Lesson")
      content_page = ContentPage.create!(title: "Test Content", lesson: lesson)
      
      expect { lesson.destroy }.to change { ContentPage.count }.by(-1)
    end
    
    it "destroys dependent assessment pages when deleted" do
      lesson = Lesson.create!(title: "Test Lesson")
      assessment_page = AssessmentPage.create!(title: "Test Assessment", lesson: lesson)
      
      expect { lesson.destroy }.to change { AssessmentPage.count }.by(-1)
    end
  end
end