class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_pic,      default: "robohash.org/#{:first_name}?set=set4"
      t.string :email
      t.integer :pinned_task_id,  default: nil
      t.text :notes,              default: nil
      t.string :password_digest

      t.timestamps
    end
  end
end
