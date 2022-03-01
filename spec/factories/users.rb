FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{name.downcase.gsub(/ /, '_')}@email.com" }
    # password { 'password123' }
    # password_confirmation { 'password123' }
    zip { '80918' }
  end
end
