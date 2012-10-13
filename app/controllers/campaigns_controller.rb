class CampaignsController < ApplicationController
  skip_before_filter :require_login
  def show
    @campaign = Campaign.find_by_random_id(params[:id])
    @payments_completed = @campaign.paid
  end

  skip_before_filter :require_login # TODO: remove this
  def create
  end

  skip_before_filter :require_login # TODO: remove this
  def index
    campaigns = Campaign.all
    @closed_campaigns = campaigns.select{|x| x.closed?}
    @open_campaigns = campaigns - @closed_campaigns
  end
end
