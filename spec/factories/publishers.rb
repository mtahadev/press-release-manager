# spec/factories/publishers.rb
FactoryBot.define do
  factory :publisher do
    name { "Publisher Name #{rand(1000)}" }
    organization
  end
end
