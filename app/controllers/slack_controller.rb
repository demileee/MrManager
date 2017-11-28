class SlackController < ApplicationController

  def create
    @user = User.new
    @user.first_name = request.env["omniauth.auth"]["info"]["first_name"]
    @user.last_name = request.env["omniauth.auth"]["info"]["last_name"]
    @user.email = request.env["omniauth.auth"]["info"]["email"]
    @user.token = request.env["omniauth.auth"]["credentials"]["token"]
    @user.slack_id = request.env["omniauth.auth"]["info"]["user_id"]
    puts params
    byebug
  end

end
