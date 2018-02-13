class MailingList < ActiveRecord::Migration[5.1]
  def change
    create_table :mailing_list do |t|
      t.integer :user_id
      t.string :code
      t.integer :discount
      t.boolean :valid

      t.timestamps
    end
  end
end
