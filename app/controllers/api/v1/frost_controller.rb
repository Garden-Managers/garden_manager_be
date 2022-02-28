class Api::V1::FrostController < ApplicationController
  def index
    user = User.find(params[:user_id])
    spring_dates = FrostFacade.spring_frost_dates(user.latitude, user.longitude)
    fall_dates = FrostFacade.fall_frost_dates(user.latitude, user.longitude)
    render json: FrostSerializer.format_frost_dates(spring_dates, fall_dates)
  end
end
