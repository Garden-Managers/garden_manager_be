class FrostFacade
  def self.spring_frost_dates(lat, lon)
    weather_station_data = FrostService.find_weather_station_id(lat, lon)
    weather_station_id = weather_station_data.first[:id]
    spring_data = FrostService.get_spring_frost_dates(weather_station_id)
    frost_date = spring_data[1][:prob_50]
  end

  def self.fall_frost_dates(lat, lon)
    weather_station_data = FrostService.find_weather_station_id(lat, lon)
    weather_station_id = weather_station_data.first[:id]
    fall_data = FrostService.get_fall_frost_dates(weather_station_id)
    frost_date = fall_data[1][:prob_50]
  end
end
