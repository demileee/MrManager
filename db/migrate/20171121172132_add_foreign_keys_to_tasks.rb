class AddForeignKeysToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :project, index: true
    add_reference :tasks, :user, index: true
    add_reference :tasks, :message, index: true, default: nil
  end
end
