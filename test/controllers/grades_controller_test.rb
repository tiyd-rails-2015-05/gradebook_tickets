require 'test_helper'
require 'grades_controller.rb'

# class GradesController < ApplicationController
#   def teacher_logged_in?
#     true
#   end
# end

class GradesControllerTest < ActionController::TestCase
  # include Devise::TestHelpers

  setup do
    sign_in users(:six)
    @grade = grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grade" do
    assert_difference('Grade.count') do
      post :create, grade: { assignment_id: @grade.assignment_id, score: @grade.score, student_id: @grade.student_id }
    end

    assert_redirected_to grade_path(assigns(:grade))
  end

  test "should show grade" do
    get :show, id: @grade
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @grade
  #   assert_response :success
  # end

  test "should update grade" do
    patch :update, id: @grade, grade: { assignment_id: @grade.assignment_id, score: @grade.score, student_id: @grade.student_id }
    assert_redirected_to grade_path(assigns(:grade))
  end

  test "should destroy grade" do
    assert_difference('Grade.count', -1) do
      delete :destroy, id: @grade
    end

    assert_redirected_to grades_path
  end
end
