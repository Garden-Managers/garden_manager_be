require 'rails_helper'

RSpec.describe FrostService do
  before(:each) do
    @station_id = FrostService.find_weather_station_id(39.7392, -104.9903)
  end
  describe '::find_weather_station_id' do
    it 'returns the weather station id' do
      expect(@station_id[0]).to have_key(:id)
      expect(@station_id[0]).to be_a Hash
    end
  end

  describe '::get_spring_frost_dates' do
    it 'returns the spring frost date based on weather station id' do
      @spring_frost = FrostService.get_spring_frost_dates(@station_id[0][:id])
      expect(@spring_frost).to be_an Array
      expect(@spring_frost[1]).to have_key(:temperature_threshold)
      expect(@spring_frost[1][:temperature_threshold]).to eq("32")
      expect(@spring_frost[1]).to have_key(:prob_50)
      expect(@spring_frost[1][:prob_50]).to be_a String
    end
  end

  describe '::get_fall_frost_dates' do
    it 'returns the fall frost date based on weather station id' do
      @fall_frost = FrostService.get_spring_frost_dates(@station_id[0][:id])
      expect(@fall_frost).to be_an Array
      expect(@fall_frost[1]).to have_key(:temperature_threshold)
      expect(@fall_frost[1][:temperature_threshold]).to eq("32")
      expect(@fall_frost[1]).to have_key(:prob_50)
      expect(@fall_frost[1][:prob_50]).to be_a String
    end
  end
end
