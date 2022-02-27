require 'rails_helper'

RSpec.describe 'Frost Facade' do
  it 'returns the frost date information based on location and closest weather station' do
    user = create(:user, latitude: 39.74, longitude: -104.99)
    frost_facade = FrostFacade.new
    spring_frost = frost_facade.spring_frost_dates(user.latitude, user.longitude)
    fall_frost = frost_facade.fall_frost_dates(user.latitude, user.longitude)

    expect(spring_frost).to be_a String
    expect(fall_frost).to be_a String
  end
end
