class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :message_body
      t.boolean :announcement
      t.integer :task_id

      t.timestamps
    end
  end
end
