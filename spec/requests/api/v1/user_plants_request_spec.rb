require 'rails_helper'

RSpec.describe 'User Plants API endpoints' do
  describe 'POST user_plant' do
    it 'can create user_plant' do
      user1 = create(:user)
      plant1 = create(:plant)

      user_plant_params = { user_id: user1.id, plant_id: plant1.id }

      post '/api/v1/user_plants', params: user_plant_params
      
      created_user_plant = UserPlant.last

      expect(response).to be_successful
      expect(created_user_plant.plant_id).to eq(plant1.id)
      expect(created_user_plant.user_id).to eq(user1.id)
    end

    it 'returns status 400 if record not created' do
      user1 = create(:user)
      plant1 = create(:plant)

      user_plant_params = { user_id: 561981, plant_id: plant1.id }
      post '/api/v1/user_plants', params: user_plant_params

      expect(response.status).to eq(400)
    end
  end
end
