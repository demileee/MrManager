class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.text :message_body
      t.boolean :announcement, default: false
      t.references :task, foreign_key: true, default: nil

      t.timestamps
    end
  end
end
