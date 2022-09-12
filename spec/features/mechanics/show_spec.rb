require 'rails_helper'

RSpec.describe Mechanic do
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

    it 'can display the mechanics, years of experience, and the rides they work on' do
        # And the rides are listed by thrill rating in descending order (most thrills first)
        visit "/mechanics/#{@mechanic.id}"

        expect(page).to have_content(@kara.name)
        expect(page).to have_content(@kara.years_of_experience)
        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@hurler.open)
        expect(page).to have_content(@hurler.thrill_rating)
    end
end