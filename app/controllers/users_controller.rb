class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_url
    end
    @tasks = @user.tasks.order('completed_on DESC, priority')
    @new_image = Unsplash.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.notes = params[:user][:notes]
    if @user.save(validate: false)
      redirect_to user_url(@user)
    else
      render :show
    end
  end

  def pin_task
    @user = current_user
    @user.task = Task.find(params[:task])
    if @user.save(validate: false)
      flash[:notice] = "Successfully created..."
    else
      flash[:alert] = "It no worked"
    end
    redirect_to request.referer
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
