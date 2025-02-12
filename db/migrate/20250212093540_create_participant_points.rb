class CreateParticipantPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :participant_points, primary_key:'participant_point_id' do |t|
      t.integer :person_id
      t.integer :competition_id
      t.integer :total_points
      t.integer :points_remaining

      t.timestamps
    end
  end
end
