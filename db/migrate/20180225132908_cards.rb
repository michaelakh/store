class Cards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :user_id
      
      t.string :first_name
      t.string :last_name
      
      # Stripe Columns
      t.string :stripe_id
      t.string :stripe_subscription_id
      t.string :card_brand
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.datetime :expires_at

      t.timestamps
    end
  end
end
