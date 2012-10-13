class AddRandomIdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :random_id, :string
  end
end
