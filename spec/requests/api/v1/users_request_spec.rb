require 'rails_helper'

RSpec.describe 'Users API endpoints' do
  describe 'GET users' do
    before(:each) do
      create_list(:user, 3)
      get '/api/v1/users'
    end
    let!(:users) { JSON.parse(response.body, symbolize_names: true) }

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
      user1 = create(:user)
      get '/api/v1/user', params: { email: user1.email }
    end
    let!(:user1) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(user1).to have_key(:data)
      expect(user1[:data]).to be_a(Hash)

      expect(user1[:data]).to have_key(:id)
      expect(user1[:data][:id]).to be_a(String)

      expect(user1[:data]).to have_key(:type)
      expect(user1[:data][:type]).to eq('user')

      expect(user1[:data]).to have_key(:attributes)
      expect(user1[:data][:attributes]).to be_a(Hash)

      expect(user1[:data][:attributes]).to have_key(:name)
      expect(user1[:data][:attributes][:name]).to be_a(String)

      expect(user1[:data][:attributes]).to have_key(:email)
      expect(user1[:data][:attributes][:email]).to be_a(String)

      expect(user1[:data][:attributes]).to have_key(:zip)
      expect(user1[:data][:attributes][:zip]).to be_a(String)
    end

    it 'returns status 404 if user email invalid' do
      get '/api/v1/user', params: { email: 'peacemaker@aol.com' }
      expect(response.status).to eq(404)
    end
  end

  describe 'PATCH user' do
    before(:each) do
      user1 = create(:user)
      @previous_name = user1.name
      patch "/api/v1/users/#{user1.id}", params: { user: { name: 'Jenna' } }
    end
    let!(:user1) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(user1).to have_key(:data)
      expect(user1[:data]).to be_a(Hash)

      expect(user1[:data]).to have_key(:id)
      expect(user1[:data][:id]).to be_a(String)

      expect(user1[:data]).to have_key(:type)
      expect(user1[:data][:type]).to eq('user')

      expect(user1[:data]).to have_key(:attributes)
      expect(user1[:data][:attributes]).to be_a(Hash)

      expect(user1[:data][:attributes]).to have_key(:name)
      expect(user1[:data][:attributes][:name]).to be_a(String)
      expect(user1[:data][:attributes][:name]).to_not eq(@previous_name)

      expect(user1[:data][:attributes]).to have_key(:email)
      expect(user1[:data][:attributes][:email]).to be_a(String)

      expect(user1[:data][:attributes]).to have_key(:zip)
      expect(user1[:data][:attributes][:zip]).to be_a(String)
    end

    it 'returns status 404 if user not found' do
      patch '/api/v1/users/6514980891', params: { user: { name: 'Jenna' } }

      expect(response.status).to eq(404)
    end
  end

  describe 'POST user' do
    it 'can create new user' do
      user_params = { user: { name: 'Jeff', email: 'jeff@email.com', password: 'password123', password_confirmation: 'password123', zip: '80918' } }
      post "/api/v1/users", params: user_params
      created_user = User.last

      expect(response).to be_successful
      expect(created_user.name).to eq('Jeff')
      expect(created_user.email).to eq('jeff@email.com')
      expect(created_user).to_not have_attribute(:password)
      expect(created_user.password_digest).to_not eq('password123')
    end

    it 'returns status 400 if user not created' do
      user_params = { user: { name: 'Jeff' } }
      post "/api/v1/users", params: user_params

      expect(response.status).to eq(400)
    end
  end

  describe 'DELETE user' do
    it 'can delete an item' do
      user1 = create(:user)
      expect(User.count).to eq(1)

      delete "/api/v1/users/#{user1.id}"

      expect(response).to be_successful
      expect(User.count).to eq(0)
    end
  end
end
