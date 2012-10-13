class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :message
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.integer :amount
      t.string :currency

      t.timestamps
    end
  end
end
