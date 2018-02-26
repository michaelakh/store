class Addresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :full_name
      t.string :street_ad
      t.string :street_ad2
      t.string :postcode
      t.string :country
      t.string :town_city
      t.string :phone_no
      t.string :county

      t.timestamps
    end
  end
end
