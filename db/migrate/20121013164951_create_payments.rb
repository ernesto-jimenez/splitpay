class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.string :status
      t.string :email
      t.string :name
      t.string :key
      t.string :tracking_id
      t.text :raw_details

      t.timestamps
    end
  end
end
