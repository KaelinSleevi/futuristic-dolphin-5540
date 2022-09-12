class MechanicsController < ApplicationController
    def index
       @mechanics = Mechanic.all
    end

    def show
        @mechanics = Mechanic.find(params[:id])

        if params[:search].present?
            @rides = Ride.search(params[:search])
        end
    end

    def edit
        @mechanics = Mechanic.find(params[:id])
    end

    def update
        @mechanics = Mechanic.find(params[:id])

        @mechanics.update(params[:ride_id])
        @mechanics.save
        redirect_to "/mechanics/#{@mechanics.id}"

        if params[:ride_id] != nil
            @rides = Ride.find(params[:ride_id])

            if @mechanics.save
                @mechanics.ride << @rides
            else
                redirect_to "/mechanics/#{@mechanics.id}"
            end
        end
    end

end