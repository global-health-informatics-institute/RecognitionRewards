class CreateCompetitions < ActiveRecord::Migration[8.0]
  def change
    create_table :competitions, primary_key:'competition_id' do |t|
      t.string :name
      t.string :competition_type
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
