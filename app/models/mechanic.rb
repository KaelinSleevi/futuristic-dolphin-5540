class Mechanic < ApplicationRecord
    validates_presence_of :name, :years_of_experience

    belongs_to :ride

    def self.average_years_of_experience
        average(:years_of_experience).round(2)
    end
end