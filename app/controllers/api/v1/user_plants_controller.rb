class Api::V1::UserPlantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
    user_plant = UserPlant.create(user_id: params[:user_id], plant_id: params[:plant_id])

    if user_plant.save
      render json: UserPlantSerializer.new(user_plant)
    else
      not_created
    end
  end

  def destroy
  end

private
  def not_created
    payload = {
      message: 'Plant could not be added',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end

  def not_found
    payload = {
      message: 'Unable to find record',
      code: 404,
      status: 'NOT FOUND'
    }
    render json: payload, status: :not_found
  end
end
