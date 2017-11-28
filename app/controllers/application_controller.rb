class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new_image
    @new_image = Unsplash.new
    @bg_image = DomColour.new
    @hex = @bg_image.get_pix(@new_image.image)
  end

  def user_is_logged_in
    if current_user
      redirect_to user_url(current_user)
    end
  end

  helper_method :new_image
  helper_method :current_user

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
