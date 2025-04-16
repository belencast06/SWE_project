# spec/models/content_page_spec.rb
require 'rails_helper'

RSpec.describe ContentPage, type: :model do
  describe "associations" do
    it "belongs to a lesson" do
      association = ContentPage.reflect_on_association(:lesson)
      expect(association.macro).to eq :belongs_to
    end
  end
end