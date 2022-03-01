require 'rails_helper'

RSpec.describe 'Weather API Endpoints' do
  describe 'GET weather' do
    before(:each) do
      user = create(:user, latitude: 80, longitude: 90)
      get "/api/v1/users/#{user.id}/forecast"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns the current weather and forecast data in a hash' do
      weather_data = JSON.parse(response.body, symbolize_names: true)

      expect(weather_data).to be_a Hash
      expect(weather_data[:attributes].keys).to eq([:current_day, :weekly_forecast])
    end
  end
end
