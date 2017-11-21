class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true, name: 'creator_id'
      t.references :user, foreign_key: true, name: 'assigned_id'
      t.references :message, foreign_key: true
      t.string :task_body
      t.date :completed_on,   default: nil
      t.integer :priority

      t.timestamps
    end
  end
end
