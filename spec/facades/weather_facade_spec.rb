require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#coordinates' do
    xit 'returns the coordinates based on a zip code' do
      weather = WeatherFacade.new
      coordinates = weather.coordinates(80223)

      expect(coordinates[:name]).to eq("Denver")
      expect(coordinates[:zip]).to be_a String
      expect(coordinates[:lat]).to be_an Float
      expect(coordinates[:lon]).to be_an Float
    end
  end

  describe '#all_weather' do
    xit 'returns the weather data needed for the users dashboard' do
      weather = WeatherFacade.new
      user = create(:user, zip: "80111", latitude: 80, longitude: 90)
      weather_data = weather.all_weather(user.latitude, user.longitude)

      expect(weather_data[:lat].to_s).to eq(user.latitude)
      expect(weather_data[:lon].to_s).to eq(user.longitude)
      expect(weather_data[:daily].count).to eq(8)
    end
  end
end
