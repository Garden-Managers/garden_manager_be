class Api::V1::ForecastController < ApplicationController
  def index
    user = User.find(params[:user_id])
    weather = WeatherFacade.new
    data = weather.all_weather(user.latitude, user.longitude)
    render json: ForecastSerializer.format_weather(data)
  end
end
