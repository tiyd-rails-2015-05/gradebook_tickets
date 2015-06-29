require 'test_helper'
require 'parents_controller.rb'

# class ParentsController < ApplicationController
#   def teacher_logged_in?
#     true
#   end
# end

class ParentsControllerTest < ActionController::TestCase

  setup do
    sign_in users(:six)
    @parent = users(:one)
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

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { email: "o@o.com", name: "o", password: "password", student_id: users(:three).id}
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent
    assert_response :success
  end

  test "should update parent" do
    patch :update, id: @parent, parent: { email: @parent.email, name: @parent.name, password: @parent.password, student_id: @parent.student_id }
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end
end
