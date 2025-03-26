class AssessmentPagesController < ApplicationController
  before_action :set_lesson
  before_action :set_assessment_page

  def show
    @assessment_page = @lesson.assessment_pages.find(params[:id])
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_assessment_page
    @assessment_page = @lesson.assessment_pages.find(params[:id])
  end
end
