class CreateParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :participants, primary_key:'participant_id' do |t|
      t.integer :competition_id
      t.integer :person_id

      t.timestamps
    end
  end
end
