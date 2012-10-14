module CampaignsHelper
  include ActionView::Helpers::NumberHelper
  def campaign_amount(campaign)
    number_to_currency(campaign.amount,
                       Currencies.detail(campaign.currency))
  end
end
