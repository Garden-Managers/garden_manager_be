require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#coordinates' do
    it 'returns the coordinates based on a zip code' do
      weather = WeatherFacade.new
      coordinates = weather.coordinates(80223)

      expect(coordinates.name).to eq("Denver")
      expect(coordinates.zip_code).to be_a String
      expect(coordinates.latitude).to be_an Integer
      expect(coordinates.longitude).to be_an Integer
    end
  end
end
