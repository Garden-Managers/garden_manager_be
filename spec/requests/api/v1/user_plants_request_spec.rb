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

  describe 'DELETE user_plant' do
    it 'can delete user_plant' do
      user_plant = create(:user_plant)

      expect(UserPlant.count).to eq(1)

      delete "/api/v1/user_plants/#{user_plant.id}"

      expect(response).to be_successful
      expect(UserPlant.count).to eq(0)
    end
  end

  describe 'GET user plants' do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:plant1) { create(:plant) }
    let!(:plant2) { create(:plant) }
    let!(:plant3) { create(:plant) }
    let!(:plant4) { create(:plant) }

    let!(:user_plant1) { create(:user_plant, user: user, plant: plant1) }
    let!(:user_plant2) { create(:user_plant, user: user, plant: plant2) }
    let!(:user_plant3) { create(:user_plant, user: user, plant: plant3) }
    let!(:user_plant4) { create(:user_plant, user: user2, plant: plant4) }
    let!(:user_plant5) { create(:user_plant, user: user2, plant: plant1) }

    before(:each) do
      get "/api/v1/users/#{user.id}/plants"
    end
    let!(:plants) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct number of objects' do
      expect(plants[:data].count).to eq(3)
    end

    it 'returns correct info for each object' do
      plants[:data].each do |plant|
        expect(plant).to have_key(:id)
        expect(plant[:id]).to be_a(String)

        expect(plant).to have_key(:type)
        expect(plant[:type]).to eq('plant')

        expect(plant).to have_key(:attributes)
        expect(plant[:attributes]).to be_a(Hash)

        expect(plant[:attributes]).to have_key(:name)
        expect(plant[:attributes][:name]).to be_a(String)

        expect(plant[:attributes]).to have_key(:frost_date)
        expect(plant[:attributes][:frost_date]).to be_an(Integer)

        expect(plant[:attributes]).to have_key(:maturity)
        expect(plant[:attributes][:maturity]).to be_an(Integer)
      end
    end
  end
end
