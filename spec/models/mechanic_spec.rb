require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should belong_to(:ride) }
  end

  describe "instance methods" do
    before(:each) do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @kara = @hurler.mechanics.create!(name: "Kara Smith", years_of_experience: 8)
      @steve = @scrambler.mechanics.create!(name: "Steve Jones", years_of_experience: 3)
      @mike = @ferris.mechanics.create!(name: "Mike O'Reilly", years_of_experience: 12)
    end

    it '#average_years_of_experience' do
      expect(@.average_years_of_experience).to eq(7.67)
    end
  end
end