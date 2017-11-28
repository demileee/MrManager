class AddSlackInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token, :string
    add_column :users, :slack_id, :string
  end
end
