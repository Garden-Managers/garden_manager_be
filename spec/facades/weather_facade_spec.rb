require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#coordinates' do
    it 'returns the coordinates based on a zip code' do
      weather = WeatherFacade.new
      coordinates = weather.coordinates(80223)

      expect(coordinates.name).to eq("Denver")
      expect(coordinates.zip_code).to be_a String
      expect(coordinates.latitude).to be_an String
      expect(coordinates.longitude).to be_an String
    end
  end

  describe '#all_weather' do
    it 'returns the weather data needed for the users dashboard' do
      weather = WeatherFacade.new
      weather_data = weather.all_weather(80223)
      require 'pry'; binding.pry

    end
  end
end
