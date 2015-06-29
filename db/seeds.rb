# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Teacher.create(name: "Test", email: "test@test.com", password: "password")
Student.create(name: "Student", email: "student@student.com", password: "password", teacher_id: 1)
Parent.create(name: "Parent", email: "parent@parent.com", password: "password", student_id: 2)

bobby = Student.create!(name: "Bobby Tables", email: "bobby@student.com", password: "password", teacher_id: 1)
susy = Student.create!(name: "Susy Q", email: "susy@student.com", password: "password", teacher_id: 1)
jimmy = Student.create!(name: "Jimmy", email: "jimmy@student.com", password: "password", teacher_id: 1)

assignment = Assignment.create!(name: "Algebra Lesson 1", due: Time.now, teacher_id: 1)

Grade.create!(score: 35, assignment_id: assignment.id, student_id: bobby.id)
Grade.create!(score: 85, assignment_id: assignment.id, student_id: susy.id)
Grade.create!(score: 93, assignment_id: assignment.id, student_id: jimmy.id)
