require 'rails_helper'

RSpec.describe 'Frost Date API Endpoints' do
  describe 'GET frost dates' do
    before(:each) do
      user = create(:user, latitude: 39.74, longitude: -104.99)
      get "/api/v1/users/#{user.id}/frost_date"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns the spring and fall frost dates' do
      frost_dates = JSON.parse(response.body, symbolize_names: true)

      expect(frost_dates).to be_an Array
      expect(frost_dates.count).to eq(2)
      require 'pry'; binding.pry
    end
  end
end
