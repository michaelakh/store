class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :reference
      t.string :product_iqp
      t.integer :address_id
      t.integer :user_id, index: true
      t.string :delivery
      t.decimal :price
      
      t.timestamps
    end
  end
end
