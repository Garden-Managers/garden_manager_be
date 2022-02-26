require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:frost_date) }
    it { should validate_presence_of(:maturity) }
  end
end
