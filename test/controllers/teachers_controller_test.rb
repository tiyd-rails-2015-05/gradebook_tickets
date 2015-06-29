require 'test_helper'
require 'teachers_controller.rb'

# class TeachersController < ApplicationController
#   def teacher_logged_in?
#     true
#   end
# end

class TeachersControllerTest < ActionController::TestCase
  # include Devise::TestHelpers

  setup do
    sign_in users(:six)
    @teacher = users(:six)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { email: "o@o.com", name: "o", password: "password" }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    patch :update, id: @teacher, teacher: { email: @teacher.email, name: @teacher.name, password: @teacher.password }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end

  test "should deny access without token" do
    get :index, format: :json
    assert_redirected_to api_keys_show_path
  end

  test "should grant access with token" do
    get :index, format: :json, token: "token1"
    assert response.body.match('"email":')
    assert response.body.match('"students":')
  end
end
