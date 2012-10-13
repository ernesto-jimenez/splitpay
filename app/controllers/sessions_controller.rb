class SessionsController < ApplicationController
  skip_before_filter :require_login
  def create
    user = User.login(auth_hash['info'])
    self.current_user = user
    redirect_to root_path
  end

  def destroy
    self.current_user = false
    redirect_to root_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
