# spec/factories/press_releases.rb
FactoryBot.define do
  factory :press_release do
    title { "Sample Press Release Title" }
    content { "Sample content for the press release." }
    publish_date { 6.hours.from_now }
    status { :draft }
    association :author, factory: :user
    publisher { association :publisher }
  end
end
