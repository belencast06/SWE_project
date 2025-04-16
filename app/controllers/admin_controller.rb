# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  # Skip authentication for this specific endpoint
  skip_before_action :require_login, only: :seed_database
  
  def seed_database
    unless params[:key] == "secretseedkey123"
      render plain: "Access denied", status: :forbidden
      return
    end
    
    # Run the seed file
    load Rails.root.join('db/seeds.rb')
    
    render plain: "Database seeded successfully!\n\nCurrent lessons:\n#{Lesson.all.pluck(:title).join("\n")}"
  end
end