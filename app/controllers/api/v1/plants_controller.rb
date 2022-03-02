class Api::V1::PlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: PlantSerializer.new(Plant.all)
  end

  def show
    render json: PlantSerializer.new(Plant.find(params[:id]))
  end

  def create
    plant = Plant.new(plant_params)

    if plant.save
      render json: PlantSerializer.new(plant)
    else
      not_created
    end
  end

private

  def plant_params
    params.permit(:name, :frost_date, :maturity)
  end

  def not_found
    payload = {
      message: 'Plant not found',
      code: 404,
      status: 'NOT FOUND'
    }
    render json: payload, status: :not_found
  end

  def not_created
    payload = {
      message: 'Plant could not be created',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
