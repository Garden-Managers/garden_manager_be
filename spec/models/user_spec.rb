require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_plants) }
    it { should have_many(:plants).through(:user_plants) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'secure user creation' do
    it 'saves user auth info securely' do
      user = User.create(name: 'Jeff', email: 'jeff@email.com', password: 'password123', password_confirmation: 'password123', zip: '80918')
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end
  end
end
