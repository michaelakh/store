class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :rrp
      t.decimal :price
      t.text :details
      t.text :description
      t.string :category
      t.string :brand
      t.integer :stock
      t.boolean :live, :default => false
      t.timestamps
    end
  end
end
