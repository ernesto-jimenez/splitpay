class CampaignsController < ApplicationController
  skip_before_filter :require_login
  def show
  end
  
  skip_before_filter :require_login # TODO: remove this
  def create    
  end
end
