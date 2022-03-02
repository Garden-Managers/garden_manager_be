require 'rails_helper'

RSpec.describe WeatherService do
  before(:each) do
    @coordinates = WeatherService.get_coordinates("80223")
    @weather = WeatherService.get_all_weather(@coordinates[:lat], @coordinates[:lon])
  end
  describe '::get_coordinates' do
    it 'returns the coordinates based on the zip code' do
      expect(@coordinates).to be_a Hash
      expect(@coordinates.size).to eq(5)
      expect(@coordinates).to have_key(:zip)
      expect(@coordinates).to have_key(:name)
      expect(@coordinates).to have_key(:lat)
      expect(@coordinates).to have_key(:lon)
      expect(@coordinates).to have_key(:country)

      expect(@coordinates[:lat]).to be_a Float
      expect(@coordinates[:lon]).to be_a Float
      expect(@coordinates[:name]).to be_a String
    end
  end

  describe '::get_all_weather' do
    it 'returns the needed weather info from the one call api' do
      expect(@weather).to be_a Hash
      expect(@weather).to have_key(:current)
      expect(@weather[:current]).to have_key(:dt)
      expect(@weather[:daily].count).to eq(8)

      @weather[:daily].each do |day|
        expect(day).to have_key(:dt)
        expect(day).to have_key(:temp)
        expect(day[:temp]).to have_key(:min)
        expect(day[:temp]).to have_key(:max)
        expect(day).to have_key(:weather)
        expect(day[:weather][0]).to have_key(:main)
      end
    end
  end
end
