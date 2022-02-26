FactoryBot.define do
  factory :plant do
    name { GreekPhilosophers.name }
    frost_date { Faker::Number }
    maturity { Faker::Number.between(from: -10, to: 10) }
  end
end
