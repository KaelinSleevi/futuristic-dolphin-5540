class Mechanic < ApplicationRecord
    validates_presence_of :name, :years_of_experience

    belongs_to :ride

    def average_years_of_experience
        self.average(:years_of_experience)
    end
end