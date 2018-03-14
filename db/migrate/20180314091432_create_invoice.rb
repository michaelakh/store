class CreateInvoice < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :address_id
      t.integer :order_id
      t.timestamps
    end
  end
end
