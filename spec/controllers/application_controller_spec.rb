# spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    skip_before_action :require_login, only: [:public]
    
    def index
      render plain: "Protected content"
    end
    
    def public
      render plain: "Public content"
    end
  end

  before do
    routes.draw do 
      get "index" => "anonymous#index"
      get "public" => "anonymous#public"
    end
  end

  describe "authentication and navigation controls" do
    let(:user) { User.create!(email: "test@example.com", password: "password", password_confirmation: "password") }
    
    context "when user is not logged in" do
      it "redirects protected routes to login page" do
        get :index
        expect(response).to redirect_to(login_path)
      end
      
      it "allows access to public routes" do
        get :public
        expect(response).to have_http_status(:success)
      end
      
      it "sets a flash alert message" do
        get :index
        expect(flash[:alert]).to be_present
      end
    end

    context "when user is logged in" do
      before do
        session[:user_id] = user.id
      end
      
      it "allows access to protected routes" do
        get :index
        expect(response).to have_http_status(:success)
      end
      
      it "sets current_user" do
        get :index
        expect(controller.send(:current_user)).to eq(user)
      end
      
      it "returns true for logged_in? helper" do
        get :index
        expect(controller.send(:logged_in?)).to be true
      end
    end
  end
end