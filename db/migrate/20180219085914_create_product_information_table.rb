class CreateProductInformationTable < ActiveRecord::Migration[5.1]
  def change
    create_table :product_infos do |t|
      t.integer :product_id
      t.string :product_dimensions
      t.string :item_model_number
      t.float :volume
      t.string :volume_units
      t.string :storage_instructions
      t.string :country_of_origin
      t.string :primary_ingredient_origin
      t.string :format
      t.string :speciality
      t.string :certification
      t.string :caffeine
      t.string :awards
      t.string :manufacturer
      t.text :important_info
      t.text :manufacturer_info
    end
  end
end