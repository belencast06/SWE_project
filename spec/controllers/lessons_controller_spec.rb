# spec/controllers/lessons_controller_spec.rb
require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  let(:lesson) { Lesson.create(title: "Intro to C++", content: "Test content") }
  
  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:logged_in?).and_return(true)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @lessons" do
      lesson # ensure lesson is created
      get :index
      expect(assigns(:lessons)).to include(lesson)
    end
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: lesson.id }
      expect(response).to have_http_status(:success)
    end
    
    it "assigns the requested lesson to @lesson" do
      get :show, params: { id: lesson.id }
      expect(assigns(:lesson)).to eq(lesson)
    end
  end
end