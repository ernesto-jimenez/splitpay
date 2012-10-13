class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
  private
  def current_user
    user_id = session[:user_id]
    @current_user ||= user_id ? User.find_by_id(user_id) : false
  end

  def current_user=(user)
    if user
      raise ArgumentError unless user.is_a? User
      session[:user_id] = user.id
    else
      session[:user_id] = nil
    end
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to "/auth/paypal" unless logged_in?
  end
end
