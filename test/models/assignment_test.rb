require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  test "average" do
    teacher = teachers(:one)
    assignment = Assignment.create(name: "test", teacher_id: teacher.id, due: Date.today)
    Grade.create(student_id: students(:one).id, assignment_id: assignment.id, score: 100)
    Grade.create(student_id: students(:two).id, assignment_id: assignment.id, score: 90)
    Grade.create(student_id: students(:three).id, assignment_id: assignment.id)

    assert_equal 95, assignment.average
  end
end
