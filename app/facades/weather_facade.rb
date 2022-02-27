class WeatherFacade
  def coordinates(zip_code)
    weather_data = WeatherService.get_coordinates(zip_code)
    coordinates = Coordinates.new(weather_data)
  end
end
