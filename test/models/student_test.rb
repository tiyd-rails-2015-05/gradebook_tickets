require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  test "has_grade?" do
    bob = students(:three)
    assignment = Assignment.create(name: "test", due: Date.today, teacher_id: 1)
    grade = Grade.create(student_id: bob.id, assignment_id: assignment.id)

    refute bob.has_grade?(assignment.id)

    grade.update(score: 100)

    assert bob.has_grade?(assignment.id)
  end

   test "get grade" do
     test_student = users(:three)
     assignment_test = assignments(:one)
     assert_equal 100, test_student.get_grade(assignment_test.id)
   end

end
