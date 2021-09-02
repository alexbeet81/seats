# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

puts "destroying old users"

User.destroy_all

puts "users destroyed"

puts "creating new user"
teacher = User.create!(email: 'alex@alex.com', password: 123456)

puts "creating new class group"
class_group = ClassGroup.create!(name: 'Class One', user_id: teacher.id)

puts "creating new seating chart"
seating_chart = SeatingChart.create!(number_of_students: 25, rows: 5, columns: 5, class_group_id: class_group.id)

puts "creating new students"
25.times do |i|
  new_student = Student.create!(chinese_name: "我名字", english_name: "Student #{i}", number: i, participation_score: rand(10), class_group_id: glass_group.id)
  puts "created new student #{i}"
end

puts "finished!"