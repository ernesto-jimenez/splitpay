require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  test "should get user_name" do
    campaign = campaigns(:first_campaign_from_ernesto)
    assert_equal users(:ernesto).name, campaign.user_name
  end

  test "should get user_avatar" do
    campaign = campaigns(:first_campaign_from_ernesto)
    assert_equal users(:ernesto).avatar, campaign.user_avatar
  end

  test "should get user_email" do
    campaign = campaigns(:first_campaign_from_ernesto)
    assert_equal users(:ernesto).email, campaign.user_email
  end
end
