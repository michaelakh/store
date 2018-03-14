class CouponsUsed < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons_used do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.string :code
      t.float :discount

      t.timestamps
    end
  end
end
