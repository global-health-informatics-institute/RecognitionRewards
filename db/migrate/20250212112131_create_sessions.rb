class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.integer :user_id, null: false, foreign_key: { to_table: :users }
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
