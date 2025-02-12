class Candidate < ApplicationRecord
  validates :user_id, presence: true
  validates :competition_id, presence: true

  belongs_to :user
  belongs_to :competition
end
