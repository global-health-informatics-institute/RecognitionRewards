class PointsLog < ApplicationRecord
  validates :gifter, presence: true
  validates :receiver, presence: true
  validates :competition_id, presence: true


  belongs_to :competition

end
