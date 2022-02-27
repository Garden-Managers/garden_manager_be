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

  describe 'class methods' do
    describe 'name_search' do
      it 'returns plants matched by name' do
        plant1 = create(:plant, name: 'Observe')
        plant2 = create(:plant, name: 'Preserve')
        plant3 = create(:plant, name: 'Deserve')
        plant4 = create(:plant, name: 'Conserve')
        plant5 = create(:plant, name: 'Pikachu')

        expect(Plant.name_search('serve')).to eq([plant1, plant2, plant3, plant4])
        expect(Plant.name_search('serve')).to_not include(plant5)
      end
    end
  end
end
