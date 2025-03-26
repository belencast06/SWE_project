class LessonsController < ApplicationController
  LESSONS = {
    "Lesson 1" => "This is Lesson 1 content.",
    "Lesson 2" => "This is Lesson 2 content.",
    "Lesson 3" => "This is Lesson 3 content.",
  }

  def show
    @lesson_title = params[:id].humanize
    @lesson_content = LESSONS[params[:id]] || "Lesson not found."
  end
end
