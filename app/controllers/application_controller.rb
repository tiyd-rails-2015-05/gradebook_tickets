require 'authentication.rb'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authentication

  before_action :authenticate_user!, except: [:teacher_logged_in?, :parent_logged_in?, :student_logged_in?]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :check_api_key, only: [:index, :show]

  private def teacher_logged_in?
    unless current_user.type == "Teacher"
      redirect_to user_session_path, notice: 'Please login to view this page.'
    end
  end

  private def parent_logged_in?
    unless current_user.type == "Parent"
      redirect_to root_path, notice: 'You are not a parent!'
    end
  end

  private def student_logged_in?
    unless current_user.type == "Student"
      redirect_to root_path, notice: 'You are not a student!'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:type, :email, :password) }
  end

  def check_api_key
    if params[:format] == 'json'
      redirect_to api_keys_show_path, notice: "Unauthorized" unless ApiKey.exists?(token: params[:token])
    end
  end

end
