class AddInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :invite_accepted, :boolean, default: false
  end
end
