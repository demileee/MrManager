class AddColumnToTasksTable < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :assigned_by_owner, :boolean
  end
end
