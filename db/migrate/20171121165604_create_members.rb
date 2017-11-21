class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role,   default: nil

      t.timestamps
    end
  end
end
