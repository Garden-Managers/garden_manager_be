class WeatherFacade
  def coordinates(zip_code)
    WeatherService.get_coordinates(zip_code)
  end

  def all_weather(lat, lon)
    WeatherService.get_all_weather(lat, lon)
  end
end
