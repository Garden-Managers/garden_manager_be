FactoryBot.define do
  factory :user_plant do
    association :user, factory: :user
    association :plant, factory: :plant
  end
end
