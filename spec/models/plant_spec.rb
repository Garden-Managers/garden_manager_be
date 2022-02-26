require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'relationships' do
    it { should have_many(:user_plants) }
    it { should have_many(:users).through(:user_plants) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:frost_date) }
    it { should validate_presence_of(:maturity) }
  end
end
