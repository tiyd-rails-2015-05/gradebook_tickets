# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Teacher.create(name: "Test", email: "test@test.com", password: "password")
50.times do
Student.create(name: "Student", email: "student@student.com", password: "password", teacher_id: 1)
end
Parent.create(name: "Parent", email: "parent@parent.com", password: "password", student_id: 1)
