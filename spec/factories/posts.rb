FactoryBot.define do
  factory :post do
    description { Faker::Lorem::paragraph }
    image { "#{Rails.root}/spec/fixtures/avatar.png" }
    association :user, factory: :user
  end 
end