class WeatherService
  def self.get_coordinates(zip_code)
    response = Faraday.get("http://api.openweathermap.org/geo/1.0/zip?zip=#{zip_code}&appid=#{ENV['weather_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
