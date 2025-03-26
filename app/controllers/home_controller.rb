class HomeController < ApplicationController
  def index
    @lessons = Lesson.all # Fetch lessons to display them dynamically
  end
end
