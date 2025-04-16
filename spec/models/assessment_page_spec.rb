# spec/models/assessment_page_spec.rb
require 'rails_helper'

RSpec.describe AssessmentPage, type: :model do
  describe "associations" do
    it "belongs to a lesson" do
      association = AssessmentPage.reflect_on_association(:lesson)
      expect(association.macro).to eq :belongs_to
    end
  end
end