class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user
      @user.delete
      redirect_to root_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_pic ,:email, :notes, :password, :password_confirmation)
  end

end

#######in task controller
# def pin
#   @user = current_user
#   @user.task = @task
# end
