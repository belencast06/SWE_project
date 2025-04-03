class HomeController < ApplicationController
  before_action :require_login

  def index
    @lessons = Lesson.all # Fetch lessons to display them dynamically
  end
end
