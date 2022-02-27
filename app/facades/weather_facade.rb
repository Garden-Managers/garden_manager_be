class WeatherFacade
  def coordinates(zip_code)
    weather_data = WeatherService.get_coordinates(zip_code)
    Coordinates.new(weather_data)
  end

  def all_weather(lat, lon)
    WeatherService.get_all_weather(lat, lon)
  end
end
