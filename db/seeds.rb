# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   
# Clear existing data
Lesson.destroy_all
ContentPage.destroy_all
AssessmentPage.destroy_all

# Create Lessons
lesson1 = Lesson.create(title: "Lesson 1")
lesson2 = Lesson.create(title: "Lesson 2")
lesson3 = Lesson.create(title: "Lesson 3")

# Create Content Pages for Each Lesson
lesson1.content_pages.create(title: "Lesson 1 - Introduction", body: "This is the introduction to Lesson 1.")
lesson1.content_pages.create(title: "Lesson 1 - Page 1", body: "This is Page 1 in Lesson 1.")

lesson2.content_pages.create(title: "Lesson 2 - Introduction", body: "This is the introduction to Lesson 2.")
lesson2.content_pages.create(title: "Lesson 2 - Page 1", body: "This is Page 1 in Lesson 2.")

lesson3.content_pages.create(title: "Lesson 3 - Introduction", body: "This is the introduction to Lesson 3.")
lesson3.content_pages.create(title: "Lesson 3 - Page 1", body: "This is Page 1 in Lesson 3.")

# Create assessment pages for each lesson
lesson1.assessment_pages.create(title: "Lesson 1 - Assessment", content: "This is the assessment for Lesson 1.")
lesson2.assessment_pages.create(title: "Lesson 2 - Assessment", content: "This is the assessment for Lesson 2.")
lesson3.assessment_pages.create(title: "Lesson 3 - Assessment", content: "This is the assessment for Lesson 3.")

puts "Seeded lessons and content pages!"
