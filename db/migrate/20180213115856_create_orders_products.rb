class CreateOrdersProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_products, id: false do |t|
      t.belongs_to  :order, index: true
      t.belongs_to  :product, index: true
      t.timestamps
    end
  end
end
