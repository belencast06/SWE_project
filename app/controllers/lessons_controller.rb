class LessonsController < ApplicationController
  LESSONS = {
    "Lesson 1" => "This is Lesson 1 content.",
    "Lesson 2" => "This is Lesson 2 content.",
    "Lesson 3" => "This is Lesson 3 content.",
  }

  def show
    @lesson = Lesson.find(params[:id])  # This fetches a lesson by its ID
  end
  def index
    @lessons = Lesson.all
  end

  Lesson.create!(
  [
    { title: "Lesson 1: Introduction to C++", content: "Learn about syntax, comments, operators, and the main function." },
    { title: "Lesson 2: Variables in C++", content: "Explore how variables are declared, types used, and naming best practices." },
    { title: "Lesson 3: Expressions in C++", content: "Understand different kinds of expressions and how they're evaluated." }
  ]
)

end
