# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :ensure_logged_in
  before_action :set_forum_post
  
  def create
    @comment = @forum_post.comments.new(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to forum_post_path(@forum_post), notice: 'Comment was successfully added.'
    else
      redirect_to forum_post_path(@forum_post), alert: 'Error adding comment.'
    end
  end
  
  def destroy
    @comment = @forum_post.comments.find(params[:id])
    
    if @comment.user == current_user
      @comment.destroy
      redirect_to forum_post_path(@forum_post), notice: 'Comment was deleted.'
    else
      redirect_to forum_post_path(@forum_post), alert: 'You can only delete your own comments.'
    end
  end
  
  private
  
  def set_forum_post
    @forum_post = ForumPost.find(params[:forum_post_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :parent_comment_id)
  end
  
  def ensure_logged_in
    redirect_to login_path, alert: "You must be logged in to comment" unless logged_in?
  end
end