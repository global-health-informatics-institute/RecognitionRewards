class PointsLog < ApplicationRecord
  validates :person_id, presence: true
  validates :candidate_id, presence: true
  validates :competition_id, presence: true

  belongs_to :person
  belongs_to :candidate
  belongs_to :competition
end
