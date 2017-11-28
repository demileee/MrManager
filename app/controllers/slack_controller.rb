require 'securerandom'

class SlackController < ApplicationController

  def create
    pass = SecureRandom.base64
    @user = User.new
    @user.first_name = request.env["omniauth.auth"]["info"]["first_name"]
    @user.last_name = request.env["omniauth.auth"]["info"]["last_name"]
    @user.email = request.env["omniauth.auth"]["info"]["email"]
    @user.token = request.env["omniauth.auth"]["credentials"]["token"]
    @user.slack_id = request.env["omniauth.auth"]["info"]["user_id"]
    @user.password = pass
    @user.password_confirmation = pass

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

end
