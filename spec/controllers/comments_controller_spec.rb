# spec/controllers/comments_controller_spec.rb
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }
  let(:forum_post) { ForumPost.create(title: "Test Post", content: "Test Content", category: "general", user: user) }
  
  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:logged_in?).and_return(true)
  end
  
  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        { 
          forum_post_id: forum_post.id,
          comment: {
            content: "Test comment"
          }
        }
      end
      
      it "creates a new comment" do
        expect {
          post :create, params: valid_params
        }.to change(Comment, :count).by(1)
      end
      
      it "redirects to the forum post" do
        post :create, params: valid_params
        expect(response).to redirect_to(forum_post)
      end
      
      context "with a parent comment" do
        let!(:parent_comment) { Comment.create(content: "Parent comment", forum_post: forum_post, user: user) }
        let(:valid_params_with_parent) do
          { 
            forum_post_id: forum_post.id,
            comment: {
              content: "Reply comment",
              parent_comment_id: parent_comment.id
            }
          }
        end
        
        it "creates a reply comment" do
          expect {
            post :create, params: valid_params_with_parent
          }.to change(Comment, :count).by(1)
        end
        
        it "assigns the parent comment" do
          post :create, params: valid_params_with_parent
          # Find the specific comment we just created instead of relying on Comment.last
          new_comment = Comment.find_by(content: "Reply comment")
          expect(new_comment.parent_comment_id).to eq(parent_comment.id)
        end
      end
    end
  end
  
  describe "DELETE #destroy" do
    let!(:comment) { Comment.create(content: "Test comment", forum_post: forum_post, user: user) }
    
    it "destroys the comment" do
      expect {
        delete :destroy, params: { forum_post_id: forum_post.id, id: comment.id }
      }.to change(Comment, :count).by(-1)
    end
    
    it "redirects to the forum post" do
      delete :destroy, params: { forum_post_id: forum_post.id, id: comment.id }
      expect(response).to redirect_to(forum_post)
    end
  end
end