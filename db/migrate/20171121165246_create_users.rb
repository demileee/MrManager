class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_pic
      t.string :email
      t.integer :pinned_task_id
      t.text :notes
      t.string :password_digest

      t.timestamps
    end
  end
end
