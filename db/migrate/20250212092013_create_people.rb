class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people, primary_key: 'person_id' do |t|
      t.string :first_name
      t.string :last_name
      t.date :DoB
      t.string :gender
      t.timestamps
    end
  end
end
