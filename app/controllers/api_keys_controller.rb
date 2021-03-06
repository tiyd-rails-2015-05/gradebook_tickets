class ApiKeysController < ApplicationController
  before_action :teacher_logged_in?, except: :show

  def new
    @apikey = ApiKey.new
  end


  def create
    @random_token = SecureRandom.hex
    ApiKey.create!(token: @random_token)
    redirect_to api_keys_show_path, :flash => { :random_token => @random_token }
  end

end
