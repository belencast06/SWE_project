class LessonsController < ApplicationController
  LESSONS = {
    "Lesson 1" => "This is Lesson 1 content.",
    "Lesson 2" => "This is Lesson 2 content.",
    "Lesson 3" => "This is Lesson 3 content.",
  }

  def show
    @lesson = Lesson.find(params[:id])  # This fetches a lesson by its ID
  end
end
