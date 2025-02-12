class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, primary_key: 'user_id' do |t|
      t.integer :person_id, null: false, foreign_key: { to_table: :people }
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
