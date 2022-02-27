class WeatherService
  def self.get_coordinates(zip_code)
    response = Faraday.get("http://api.openweathermap.org/geo/1.0/zip?zip=#{zip_code}&appid=#{ENV['weather_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_weather(lat, lon)
    conn = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params[:lat] = lat
      faraday.params[:lon] = lon
      faraday.params[:exclude] = "minutely,hourly"
      faraday.params[:units] = "imperial"
      faraday.params[:appid] = ENV['weather_api_key']
    end

    response = conn.get("/data/2.5/onecall")
    JSON.parse(response.body, symbolize_names: true)
  end
end
