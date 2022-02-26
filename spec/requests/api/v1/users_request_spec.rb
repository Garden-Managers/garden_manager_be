require 'rails_helper'

RSpec.describe 'Users API endpoints' do
  describe 'GET users' do
    before(:each) do
      create_list(:user, 3)
      get '/api/v1/users'
    end
    let!(:users) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct number of objects' do
      expect(users[:data].count).to eq(3)
    end

    it 'returns correct info for each object' do
      users[:data].each do |user|
        expect(user).to have_key(:id)
        expect(user[:id]).to be_a(String)

        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to be_a(Hash)

        expect(user[:attributes]).to have_key(:name)
        expect(user[:attributes][:name]).to be_a(String)

        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to be_a(String)

        expect(user[:attributes]).to have_key(:zip)
        expect(user[:attributes][:zip]).to be_a(String)
      end
    end
  end

  describe 'GET user' do
    before(:each) do
      user_1 = create(:user)
      get "/api/v1/user", params: {email: user_1.email}
    end
    let!(:user_1) {JSON.parse(response.body, symbolize_names: true)}

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(user_1).to have_key(:data)
      expect(user_1[:data]).to be_a(Hash)

      expect(user_1[:data]).to have_key(:id)
      expect(user_1[:data][:id]).to be_a(String)

      expect(user_1[:data]).to have_key(:type)
      expect(user_1[:data][:type]).to eq('user')

      expect(user_1[:data]).to have_key(:attributes)
      expect(user_1[:data][:attributes]).to be_a(Hash)

      expect(user_1[:data][:attributes]).to have_key(:name)
      expect(user_1[:data][:attributes][:name]).to be_a(String)

      expect(user_1[:data][:attributes]).to have_key(:email)
      expect(user_1[:data][:attributes][:email]).to be_a(String)

      expect(user_1[:data][:attributes]).to have_key(:zip)
      expect(user_1[:data][:attributes][:zip]).to be_a(String)
    end

    xit 'returns status 404 if user email invalid' do
      get "/api/v1/users/peacemaker@aol.com"
      expect(response.status).to eq(404)
    end
  end
end
