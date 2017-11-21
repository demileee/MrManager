class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :creator_id
      t.integer :assigned_id
      t.integer :message_id
      t.string :task_body
      t.date :completed_on
      t.integer :priority

      t.timestamps
    end
  end
end
