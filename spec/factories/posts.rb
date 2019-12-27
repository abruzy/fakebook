FactoryBot.define do
  factory :post do
    description { Faker::Lorem.paragraphs }
    image { 'http://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802' }
    association :user, factory: :user
  end 
end