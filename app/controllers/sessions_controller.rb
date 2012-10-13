class SessionsController < ApplicationController
  def create
    logger.debug(auth_hash)
    info = auth_hash['info']
    name = info['name']
    email = info['email']
    render :text => "Logged in as #{name} &lt;#{email}&gt;"
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
