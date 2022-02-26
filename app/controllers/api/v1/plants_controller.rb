class Api::V1::PlantsController < ApplicationController
  recue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: PlantSerializer.new(Plant.all)
  end

  def show
    render json: PlantSerializer.new(Plant.find(params[:id]))
  end

  def create
    plant = Plant.create(plant_params)

    if plant.save
      render json: PlantSerializer.new(plant)
    else
      not_created
    end
  end

  private

  def not_created
    payload = {
      message: 'Plant could not be created',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
