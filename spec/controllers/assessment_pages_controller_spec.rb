# spec/controllers/assessment_pages_controller_spec.rb
require 'rails_helper'

RSpec.describe AssessmentPagesController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  let(:lesson) { Lesson.create(title: "Intro to C++", content: "Test content") }
  let(:assessment_page) { AssessmentPage.create(title: "Intro to C++ - Assessment", lesson: lesson) }
  
  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:logged_in?).and_return(true)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { lesson_id: lesson.id, id: assessment_page.id }
      expect(response).to have_http_status(:success)
    end
    
    it "assigns the requested assessment_page to @assessment_page" do
      get :show, params: { lesson_id: lesson.id, id: assessment_page.id }
      expect(assigns(:assessment_page)).to eq(assessment_page)
    end
    
    it "assigns the lesson to @lesson" do
      get :show, params: { lesson_id: lesson.id, id: assessment_page.id }
      expect(assigns(:lesson)).to eq(lesson)
    end
  end
end