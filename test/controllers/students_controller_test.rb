require 'test_helper'
require 'students_controller.rb'

class StudentsController < ApplicationController
  def teacher_logged_in?
    true
  end
end

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = users(:three)
    @teacher = users(:six)
    current_user.id = @teacher.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { email: @student.email, name: @student.name, password: "password" }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { email: @student.email, name: @student.name, encrypted_password: @student.encrypted_password }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end

  test "should deny access without token" do
    get :index, format: :json
    assert_redirected_to api_keys_show_path
  end

  test "should grant access with token" do
    get :index, format: :json, token: "token1"
    assert response.body.match('"teacher":')
  end
end
