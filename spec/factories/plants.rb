FactoryBot.define do
  factory :plant do
    name { Faker::GreekPhilosophers.name }
    frost_date { Faker::Number.between(from: -10, to: 10) }
    maturity { Faker::Number.number(digits: 2) }
  end
end
