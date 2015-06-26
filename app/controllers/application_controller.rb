require 'authentication.rb'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Authentication
  before_action :check_api_key, only: [:index, :show]

  def check_api_key
    if params[:format] == 'json'
      blow up
    end
  end
end
