class CreatePReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :p_reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :rating
      t.text :headline
      t.text :content
      t.timestamps
    end
  end
end
