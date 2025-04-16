class AdminController < ApplicationController
  # Skip any authentication for this specific action
  skip_before_action :require_login, only: :cleanup_lessons
  
  def cleanup_lessons
    # Add a simple "password" protection
    unless params[:key] == "cleanup123"
      render plain: "Access denied", status: :forbidden
      return
    end
    
    # Group lessons by title and keep only the first one
    grouped = Lesson.all.group_by(&:title)
    deleted = 0
    
    # Track what we found and deleted
    original_count = Lesson.count
    
    grouped.each do |title, lessons_array|
      lessons_array.drop(1).each do |lesson|
        lesson.destroy
        deleted += 1
      end
    end
    
    # Show a summary of what happened
    render plain: "Cleanup complete.\n\n" +
                 "Original lesson count: #{original_count}\n" +
                 "Duplicate lessons deleted: #{deleted}\n" +
                 "Remaining lesson count: #{Lesson.count}\n\n" +
                 "Remaining lessons:\n" +
                 Lesson.all.pluck(:title).join("\n")
  end
end