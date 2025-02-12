class ParticipantPoint < ApplicationRecord
  validates :person_id, presence: true
  validates :competition_id, presence: true

  belongs_to :person
  belongs_to :competition
end
