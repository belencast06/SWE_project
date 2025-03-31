require 'rails_helper'

# very basic start to controller tests

RSpec.describe ForumPostsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      category = ForumCategory.find_by(name: "General Discussion")
      get :index, params: { forum_category_id: category.id }
      expect(response).to be_successful
    end
  end
end