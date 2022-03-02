require 'rails_helper'

RSpec.describe WeatherService do
  describe '::get_coordinates' do
    it 'returns the coordinates based on the zip code' do
      coordinates = WeatherService.get_coordinates("80223")

      expect(coordinates).to be_a Hash
      expect(coordinates.size).to eq(5)
      expect(coordinates).to have_key(:zip)
      expect(coordinates).to have_key(:name)
      expect(coordinates).to have_key(:lat)
      expect(coordinates).to have_key(:lon)
      expect(coordinates).to have_key(:country)

      expect(coordinates[:lat]).to be_a Float
      expect(coordinates[:lon]).to be_a Float
      expect(coordinates[:name]).to be_a String
    end
  end
end
