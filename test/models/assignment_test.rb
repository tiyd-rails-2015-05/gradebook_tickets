require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  test "should assign students" do
    teacher = Teacher.create!(name: "Test", email: "test@test.com", password: "password")
    assignment = Assignment.create!(name: "Homework", due: Time.now + 1.day, teacher_id: teacher.id)
    bobby = Student.create!(name: "Bobby Tables", email: "bobby@student.com", password: "password", teacher_id: teacher.id)
    grade = Grade.find_by_student_id(bobby.id)

    assert_equal nil, grade



  end

  test "average" do
    teacher = teachers(:one)
    assignment = Assignment.create(name: "test", teacher_id: teacher.id, due: Date.today)
    Grade.create(student_id: students(:one).id, assignment_id: assignment.id, score: 100)
    Grade.create(student_id: students(:two).id, assignment_id: assignment.id, score: 90)
    Grade.create(student_id: students(:three).id, assignment_id: assignment.id)

    assert_equal 95, assignment.average
  end
end
