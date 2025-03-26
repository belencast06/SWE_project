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
Lesson.create(title: "Lesson 1", content: "This is lesson 1 content.")
Lesson.create(title: "Lesson 2", content: "This is lesson 2 content.")
Lesson.create(title: "Lesson 3", content: "This is lesson 3 content.")
