class ChangePinnedTaskIdToTaskId < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pinned_task_id
    add_reference :users, :task, foreign_key: true, default: nil
  end
end
