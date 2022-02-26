class WeatherFacade
  def all_weather(zip_code)
    weather_data = WeatherService.get_all_weather(zip_code)
    require 'pry'; binding.pry
  end
end
