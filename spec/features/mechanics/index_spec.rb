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

    it 'can list each mechanic and their years of experience' do
        visit "/mechanics"

        within("#mechanic_#{@kara.id}") do
            expect(page).to have_content(@kara.name)
            expect(page).to have_content(@kara.years_of_experience)
            expect(page).to_not have_content(@steve.name)
        end

        within("#mechanic_#{@steve.id}") do
            expect(page).to have_content(@steve.name)
            expect(page).to have_content(@steve.years_of_experience)
            expect(page).to_not have_content(@mike.name)
        end

        within("#mechanic_#{@mike.id}") do
            expect(page).to have_content(@mike.name)
            expect(page).to have_content(@mike.years_of_experience)
            expect(page).to_not have_content(@kara.name)
        end
    end

    it 'can show the average years of experience over all mechanics' do
        visit "/mechanics"

        expect(page).to have_content("Average Years of Experience: 7.67")
    end
end