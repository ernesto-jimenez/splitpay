class CampaignsController < ApplicationController
  skip_before_filter :require_login, :only => :show
  include CampaignsHelper
  def show
    @campaign = Campaign.find_by_random_id!(params[:id])
    @payments_completed = @campaign.paid

    @email_data = {:subject => "Money for #{@campaign.title}",
                   :body => <<-EOS
Hi!

I'm collecting the money for #{@campaign.title} (#{
campaign_amount(@campaign)} per person)

Please go to #{url_for(:action => 'show', :controller => 'campaigns', :only_path => false)} to pay.

#{@campaign.message}
EOS
                  }
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(params[:campaign])

    if @campaign.save
      redirect_to @campaign
    else
      render :action => :new
    end
  end

  def index
    campaigns = Campaign.all
    @closed_campaigns = campaigns.select{|x| x.closed?}
    @open_campaigns = campaigns - @closed_campaigns
  end

  def current_user
    User.first
  end
end
