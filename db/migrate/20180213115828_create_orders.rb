class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :product_id, index: true
      t.integer :user_id, index: true
      t.integer :qty
      t.decimal :price
      
      t.timestamps
    end
  end
end
