require 'rails_helper'

RSpec.describe 'Weather API Endpoints' do
  describe 'GET weather' do
    before(:each) do
      user = create(:user)
      get "/api/v1/user/#{user.id}/forecast"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    # it 'returns the current weather and forecast data in a hash' do
    #   require 'pry'; binding.pry
    # end
  end
end
