class CreateCandidates < ActiveRecord::Migration[8.0]
  def change
    create_table :candidates, primary_key: 'candidate_id' do |t|
      t.integer :user_id
      t.integer :competition_id
      t.timestamps
    end
  end
end
