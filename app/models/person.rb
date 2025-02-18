class Person < ApplicationRecord
  has_one :user

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
