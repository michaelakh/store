class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end
