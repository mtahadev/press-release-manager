# spec/factories/organizations.rb
FactoryBot.define do
  factory :organization do
    name { "Org Name #{rand(1000)}" }
    description { "Test Description" }
  end
end