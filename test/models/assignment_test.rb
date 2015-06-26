require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "should assign students" do
    teacher = Teacher.create!(name: "Test", email: "test@test.com", password: "password")
    assignment = Assignment.create!(name: "Homework", due: Time.now + 1.day, teacher_id: teacher.id)
    bobby = Student.create!(name: "Bobby Tables", email: "bobby@student.com", password: "password", teacher_id: teacher.id)
    grade = Grade.find_by_student_id(bobby.id)

    assert_equal nil, grade

    

  end

end
