class MechanicsController < ApplicationController
    def index
       @mechanics = Mechanic.all
    end

    def show
        @mechanics = Mechanic.find(params[:id])
    end
end