require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
    
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
  
  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          user: {
            email: "test@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      end
      
      it "creates a new user" do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)
      end
      
      it "sets the session user_id" do
        post :create, params: valid_params
        expect(session[:user_id]).not_to be_nil
      end
      
      it "redirects to the home page" do
        post :create, params: valid_params
        expect(response).to redirect_to(home_path)
      end
    end
    
    context "with invalid parameters" do
      let(:invalid_params) do
        {
          user: {
            email: "invalid-email",
            password: "password",
            password_confirmation: "password"
          }
        }
      end
      
      it "does not create a new user" do
        expect {
          post :create, params: invalid_params
        }.not_to change(User, :count)
      end
      
      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
    
    context "with mismatched passwords" do
      let(:mismatched_params) do
        {
          user: {
            email: "test@example.com",
            password: "password",
            password_confirmation: "different"
          }
        }
      end
      
      it "does not create a new user" do
        expect {
          post :create, params: mismatched_params
        }.not_to change(User, :count)
      end
      
      it "renders the new template" do
        post :create, params: mismatched_params
        expect(response).to render_template(:new)
      end
    end
  end
end