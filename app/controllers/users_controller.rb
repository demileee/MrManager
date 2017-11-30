class UsersController < ApplicationController

  before_action :load_user,  except: %i(new create show)

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
      @tasks = @user.tasks.select{ |task| !task.complete? }
      @tasks = @user.tasks.select{ |task| !task.complete? }
      if @user.last_read.present?
        @notifications = Notification.where('created_at > ? AND user_id = ?', current_user.last_read, current_user.id )
      else
        @notifications = Notification.where('user_id = ?', current_user.id).last(10).reverse
      end
    else
      redirect_to login_url
    end
  end

  def edit
  end

  def update
    @user.notes = params[:user][:notes]
    if @user.save(validate: false)
      redirect_to user_url(@user)
    else
      render :show
    end
  end

  def last_read
    @user.last_read = Time.now
    if @user.save(validate: false)
      redirect_to request.referer
    end
  end

  def pin_task
    @user.task = Task.find(params[:task])
    if @user.save(validate: false)
      flash[:notice] = "Successfully created..."
    else
      flash[:alert] = "It no worked"
    end
    redirect_to request.referer
  end

  def destroy
    if @user
      @user.delete
      redirect_to root_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_pic ,:email, :notes, :password, :password_confirmation)
  end

  def load_user
    @user = current_user
  end
end
