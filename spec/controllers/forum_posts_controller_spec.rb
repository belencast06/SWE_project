# spec/controllers/forum_posts_controller_spec.rb
require 'rails_helper'

RSpec.describe ForumPostsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  
  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:logged_in?).and_return(true)
  end
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @posts for the default category" do
      post1 = ForumPost.create(title: "Post 1", content: "Content 1", category: "general", user: user)
      post2 = ForumPost.create(title: "Post 2", content: "Content 2", category: "help", user: user)
      
      get :index
      expect(assigns(:posts)).to include(post1)
      expect(assigns(:posts)).not_to include(post2)
    end
    
    it "assigns @posts for a specified category" do
      post1 = ForumPost.create(title: "Post 1", content: "Content 1", category: "general", user: user)
      post2 = ForumPost.create(title: "Post 2", content: "Content 2", category: "help", user: user)
      
      get :index, params: { category: "help" }
      expect(assigns(:posts)).to include(post2)
      expect(assigns(:posts)).not_to include(post1)
    end
  end
  
  describe "GET #show" do
    let(:post) { ForumPost.create(title: "Test Post", content: "Test Content", category: "general", user: user) }
    
    it "returns http success" do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "assigns the requested post to @post" do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end
  
  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        { 
          forum_post: {
            title: "New Post",
            content: "New Content",
            category: "general"
          }
        }
      end
      
      it "creates a new forum post" do
        expect {
          post :create, params: valid_params
        }.to change(ForumPost, :count).by(1)
      end
      
      it "redirects to the created post" do
        post :create, params: valid_params
        expect(response).to redirect_to(ForumPost.last)
      end
    end
  end
end