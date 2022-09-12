class Ride < ApplicationRecord
  validates_presence_of :name, :thrill_rating, :open

  belongs_to :amusement_park
  has_many :mechanics
end