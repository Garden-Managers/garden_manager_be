class Api::V1::PlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    render json: PlantSerializer.new(Plant.all)
  end

  def show
    render json: PlantSerializer.new(Plant.find(params[:id]))
  end

private

  def not_found
    payload = {
      message: 'Plant not found',
      code: 404,
      status: 'NOT FOUND'
    }
    render json: payload, status: :not_found
  end

end
