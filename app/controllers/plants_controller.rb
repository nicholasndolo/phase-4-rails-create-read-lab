class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants, only: [:id, :name, :image, :price ], status: :ok
    end

    def show
        plant = Plant.find(params[:id])
        if plant
         render json: plant, only: [:id, :name, :image, :price], status: :ok
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
