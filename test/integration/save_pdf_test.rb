require 'test_helper'

class SavePdfTest < ActionDispatch::IntegrationTest

  test "get root_path" do
    get root_path
    assert_response :redirect
  end


  test "navigate to grade" do
    @teacher = teachers(:one)
    get new_grade_path, {'id' => @teacher.id}, {'user_id' => @teacher.id}
    assert_response :success
    post grades_path, {'grade' => {'assignment_id' => assignments(:one).id, 'score' => 50, 'student_id' => students(:one).id}}, {'user_id' => @teacher.id}
    assert_response :redirect
  end


end
