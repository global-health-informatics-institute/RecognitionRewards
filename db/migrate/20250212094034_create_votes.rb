class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes, primary_key: 'vote_id' do |t|
      t.integer :competition_id
      t.integer :person_id
      t.integer :candidate_id

      t.timestamps
    end
  end
end
