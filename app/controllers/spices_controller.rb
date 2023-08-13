# the Spices Controller which connects to the Spice Model
class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spice = Spice.find(params[:id])
        render json: spice
      end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice.update(spice_params)
            render json: spice
        else
            render json: { errors: spice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
end
