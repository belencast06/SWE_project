class ContentPagesController < ApplicationController
  before_action :set_lesson
  before_action :set_content_page, only: [:show]

  def show
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_content_page
    @content_page = @lesson.content_pages.find(params[:id]) # Scoped by lesson
  end
end
