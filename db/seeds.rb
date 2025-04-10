# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
Lesson.destroy_all
ContentPage.destroy_all
AssessmentPage.destroy_all

# Clear existing data
Lesson.destroy_all
ContentPage.destroy_all
AssessmentPage.destroy_all

# Create 10 named lessons with content and assessments
lesson_titles = [
  "Intro to C++",
  "Variables",
  "Expressions",
  "Conditionals",
  "Loops",
  "Functions",
  "Classes",
  "Arrays",
  "Vectors",
  "Pointers"
]

lesson_titles.each do |title|
  lesson = Lesson.create!(title: title)
  # Add content pages
  lesson.content_pages.create!(
    title: "#{title} - Introduction",
    body: "This is the introduction to #{title}."
  )
  lesson.content_pages.create!(
    title: "#{title} - Page 1",
    body: "This is Page 1 in #{title}."
  )

  # Add an assessment page
  lesson.assessment_pages.create!(
    title: "#{title} - Assessment",
    content: "This is the assessment for #{title}."
  )
end
puts "Seeded 10 lessons with consistent naming and content!"
