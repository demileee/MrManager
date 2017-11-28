require 'securerandom'

class SlackController < ApplicationController

  def update
    @user = User.find(current_user.id)
    @user.token = request.env["omniauth.auth"]["credentials"]["token"]
    @user.slack_id = request.env["omniauth.auth"]["info"]["user_id"]

    if @user.save(validate: false)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

end
