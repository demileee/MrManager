class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def call_unsplash
  #   @new_image = Unsplash.new
  #   @image = @new_image.image
  #   @photographer = @new_image.photographer
  #   @portfolio = @new_image.portfolio_link
  # end

  helper_method :current_user

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
