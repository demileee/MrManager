class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :description
      t.date :soft_deadline, default: nil
      t.date :hard_deadline

      t.timestamps
    end
  end
end
