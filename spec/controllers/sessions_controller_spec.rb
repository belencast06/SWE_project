require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  
  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end
  
  describe "POST #create" do
    context "with valid credentials" do
      let(:valid_params) do
        {
          email: user.email,
          password: "password"
        }
      end
      
      it "sets the user_id in the session" do
        post :create, params: valid_params
        expect(session[:user_id]).to eq(user.id)
      end
      
      it "redirects to the home page" do
        post :create, params: valid_params
        expect(response).to redirect_to(home_path)
      end
    end
    
    context "with invalid credentials" do
      let(:invalid_params) do
        {
          email: user.email,
          password: "wrong_password"
        }
      end
      
      it "does not set the user_id in the session" do
        post :create, params: invalid_params
        expect(session[:user_id]).to be_nil
      end
      
      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
      
      it "sets an alert flash message" do
        post :create, params: invalid_params
        expect(flash[:alert]).not_to be_nil
      end
    end
    
    context "with non-existent email" do
      let(:nonexistent_params) do
        {
          email: "nonexistent@example.com",
          password: "password"
        }
      end
      
      it "does not set the user_id in the session" do
        post :create, params: nonexistent_params
        expect(session[:user_id]).to be_nil
      end
      
      it "renders the new template" do
        post :create, params: nonexistent_params
        expect(response).to render_template(:new)
      end
      
      it "sets an alert flash message" do
        post :create, params: nonexistent_params
        expect(flash[:alert]).not_to be_nil
      end
    end
  end
  
  describe "GET #destroy" do
    before do
      session[:user_id] = user.id
    end
    
    it "clears the session" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end
    
    it "redirects to the login page" do
      get :destroy
      expect(response).to redirect_to(login_path)
    end
    
    it "sets a notice flash message" do
      get :destroy
      expect(flash[:notice]).not_to be_nil
    end
  end
end