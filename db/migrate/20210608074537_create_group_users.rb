class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
      
      t.index ["group_id"], name: "index_group_users_on_group_id"
      t.index ["user_id"], name: "index_group_users_on_user_id"
    end
  end
end
