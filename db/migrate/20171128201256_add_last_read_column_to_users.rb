class AddLastReadColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_read, :date
  end
end
