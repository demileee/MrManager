class AddProjectIdColumnInEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :project_id, :integer
  end
end
