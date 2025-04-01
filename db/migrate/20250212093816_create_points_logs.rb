class CreatePointsLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :points_logs, primary_key: 'points_log_id' do |t|
      t.integer :competition_id
      t.integer :gifter
      t.integer :receiver
      t.integer :points_awarded
      t.datetime :date_awarded
      t.boolean :status
      t.timestamps
    end
  end
end
