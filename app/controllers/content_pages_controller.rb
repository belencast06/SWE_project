class ContentPagesController < ApplicationController
  def show
    @content_page = ContentPage.find(params[:id])  # This finds the content page by ID 
  end
end
