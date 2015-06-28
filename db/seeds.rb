# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Teacher.create(name: "Test", email: "test@test.com", password: "password")
Student.create(name: "Student", email: "student@student.com", password: "password", teacher_id: 1)
Parent.create(name: "Parent", email: "parent@parent.com", password: "password", student_id: 1)

Achievement.create(name: "Paper Presentation", amount: 500)
Achievement.create(name: "Test 1", amount: 800)
Achievement.create(name: "Group Activity 1", amount: 1000)
Achievement.create(name: "Science Fair", amount: 1000)
Achievement.create(name: "Test 2", amount: 500)
Achievement.create(name: "Final Project", amount: 2000)
