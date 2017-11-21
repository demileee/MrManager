class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :user_id
      t.text :description
      t.date :soft_deadline
      t.date :hard_deadline

      t.timestamps
    end
  end
end
