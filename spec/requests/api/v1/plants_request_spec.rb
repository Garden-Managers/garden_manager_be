require 'rails_helper'

RSpec.describe 'Plants API endpoints' do
  describe 'GET plants' do
    before(:each) do
      create_list(:plant, 3)
      get '/api/v1/plants'
    end
    let!(:plants) { JSON. parse(response.body, symbolize_names: true) }

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

  describe 'GET plant' do
    before(:each) do
      plant1 = create(:plant)
      get "/api/v1/plants/#{plant1.id}"
    end
    let!(:plant1) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(plant1).to have_key(:data)
      expect(plant1[:data]).to be_a(Hash)

      expect(plant1[:data]).to have_key(:id)
      expect(plant1[:data][:id]).to be_a(String)

      expect(plant1[:data]).to have_key(:type)
      expect(plant1[:data][:type]).to eq('plant')

      expect(plant1[:data]).to have_key(:attributes)
      expect(plant1[:data][:attributes]).to be_a(Hash)

      expect(plant1[:data][:attributes]).to have_key(:name)
      expect(plant1[:data][:attributes][:name]).to be_a(String)

      expect(plant1[:data][:attributes]).to have_key(:frost_date)
      expect(plant1[:data][:attributes][:frost_date]).to be_an(Integer)

      expect(plant1[:data][:attributes]).to have_key(:maturity)
      expect(plant1[:data][:attributes][:maturity]).to be_an(Integer)
    end

    it 'returns status 404 if plant id invalid' do
      get '/api/v1/plants/58198489494'
      expect(response.status).to eq(404)
    end
  end

  describe 'POST plant' do
    it 'can create new plant' do
      plant_params = { plant: { name: 'Sunflower', frost_date: 10, maturity: 120 } }
      post '/api/v1/plants', params: plant_params
      created_plant = Plant.last

      expect(response).to be_successful
      expect(created_plant.name).to eq('Sunflower')
      expect(created_plant.frost_date).to eq(10)
      expect(created_plant.maturity).to eq(120)
    end

    it 'returns status 400 if plant not created' do
      plant_params = { plant: { name: 'Sunflower' } }
      post '/api/v1/plants', params: plant_params

      expect(response.status).to eq(400)
    end
  end
end
