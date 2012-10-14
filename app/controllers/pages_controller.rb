class PagesController < ApplicationController
  skip_before_filter :require_login

  def home
    if params[:screenshot]
      render :screenshot, :layout => false
    elsif logged_in?
      redirect_to campaigns_path
    end
  end
end
