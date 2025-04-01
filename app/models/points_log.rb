class PointsLog < ApplicationRecord
  validates :gifter, presence: true
  validates :receiver, presence: true
  validates :competition_id, presence: true


  belongs_to :competition

  def gifted_by
    Person.find(self.gifter).full_name
  end

  def gifted_to
    Person.find(self.receiver).full_name
  end

end
