require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  test "should assign students" do
    teacher = Teacher.create!(name: "Test", email: "test@test.com", password: "password")
    bobby = Student.create!(name: "Bobby Tables", email: "bobby@student.com", password: "password", teacher_id: teacher.id)
    assignment = Assignment.create!(name: "Homework", due: Time.now + 1.day, teacher_id: teacher.id)
    assignment.assign
    grade = Grade.find_by_student_id(bobby.id)

    assert_equal 1, assignment.students.count
    assert_equal nil, grade.score

    grade.update(score: 85)

    assert_equal 85, grade.score

  end

  test "average" do
    teacher = users(:six)
    assignment = Assignment.create!(name: "test", teacher_id: teacher.id, due: Date.today)
    Grade.create!(student_id: users(:three).id, assignment_id: assignment.id, score: 100)
    Grade.create!(student_id: users(:four).id, assignment_id: assignment.id, score: 90)
    Grade.create!(student_id: users(:five).id, assignment_id: assignment.id)

    assert_equal 95, assignment.average
  end
end
