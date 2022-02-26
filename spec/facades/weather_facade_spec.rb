require 'rails_helper'

RSpec.describe WeatherFacade do
  describe '#all_weather' do
    it 'returns weather from the one call endpoint' do
      weather = WeatherFacade.new

      data = weather.all_weather(80125)
    end
  end
end
