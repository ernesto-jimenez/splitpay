class AddExampleFlagToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :example, :boolean
  end
end
