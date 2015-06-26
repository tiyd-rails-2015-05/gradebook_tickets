require 'test_helper'

class ApiKeysControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
    session[:user_id] = @teacher.id
    session[:user_type] = "teacher"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_redirected_to api_keys_show_path
  end

  test "should get show" do
    get :show
    assert_response :success
  end
  
end