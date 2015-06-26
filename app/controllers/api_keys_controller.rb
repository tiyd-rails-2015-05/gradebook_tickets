class ApiKeysController < ApplicationController
  def new
    @apikey = ApiKey.new
  end

  def create
    @random_token = SecureRandom.hex
    ApiKey.create!(token: @random_token)
    redirect_to api_keys_show_path, notice: "Your Key is #{@random_token}"
  end

end
