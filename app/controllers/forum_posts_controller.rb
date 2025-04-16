class ForumPostsController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]
  
  def index
    @category = params[:category] || 'general'
    @posts = ForumPost.where(category: @category).order(created_at: :desc)
    @category_name = case @category
                     when 'general' then 'General Discussion'
                     when 'help' then 'Help & Support'
                     when 'offtopic' then 'Off-Topic'
                     else 'Forum'
                     end
  end
  
  def show
    @post = ForumPost.find(params[:id])
  end
  
  def new
    @post = ForumPost.new(category: params[:category])
    @categories = [['General Discussion', 'general'], ['Help & Support', 'help'], ['Off-Topic', 'offtopic']]
  end
  
  def create
    @post = current_user.forum_posts.build(forum_post_params)
    
    if @post.save
      redirect_to forum_post_path(@post), notice: 'Post created successfully!'
    else
      @categories = [['General Discussion', 'general'], ['Help & Support', 'help'], ['Off-Topic', 'offtopic']]
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = ForumPost.find(params[:id])
    
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to forum_posts_path(category: @post.category), notice: 'Post deleted successfully!'
    else
      redirect_to forum_post_path(@post), alert: 'You can only delete your own posts!'
    end
  end
  
  private
  
  before_action :ensure_logged_in, except: [:index, :show]

private

  def ensure_logged_in
    redirect_to login_path, alert: "You must be logged in to create posts" unless logged_in?
  end

  def forum_post_params
    params.require(:forum_post).permit(:title, :content, :category)
  end
end
