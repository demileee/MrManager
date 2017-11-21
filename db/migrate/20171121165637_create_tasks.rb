class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_body
      t.date :completed_on,   default: nil
      t.integer :priority

      t.timestamps
    end
  end
end
