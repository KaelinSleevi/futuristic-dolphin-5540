class Mechanic < ApplicationRecord
    validates_presence_of :name, :years_of_experience

    belongs_to :ride
end