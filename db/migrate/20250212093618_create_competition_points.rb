class CreateCompetitionPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :competition_points, primary_key: 'competition_point_id' do |t|
      t.integer :person_id
      t.integer :competition_id
      t.integer :points_earned

      t.timestamps
    end
  end
end
