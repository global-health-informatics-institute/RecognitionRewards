class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  belongs_to :person
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def full_name
    "#{person.first_name} #{person.last_name}"
  end
end
