class AddReasonToPointsLog < ActiveRecord::Migration[8.0]
  def change
    add_column :points_logs, :reason, :string
  end
end
