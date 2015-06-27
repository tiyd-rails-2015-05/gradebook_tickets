require 'test_helper'
require 'assignments_controller'

class AssignmentsController < ApplicationController
  def teacher_logged_in?
    true
  end
end

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @assignment = assignments(:one)
    @teacher = teachers(:six)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post :create, assignment: { due: "2015-06-04", name: "name", teacher_id: @teacher.id }
    end

    assert_redirected_to assignments_path
  end

  test "should get edit" do
    get :edit, id: @assignment
    assert_response :success
  end

  test "should update assignment" do
    patch :update, format: :js, id: @assignment, assignment: { due: @assignment.due, name: @assignment.name, teacher_id: @teacher.id }
    assert_response :success
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, id: @assignment
    end

    assert_redirected_to assignments_path
  end

  test "should deny access without token" do
    get :index, format: :json
    assert_redirected_to api_keys_show_path
  end

  test "should grant access with token" do
    get :index, format: :json, token: "token1"
    assert response.body.match('"due":')
  end

end
