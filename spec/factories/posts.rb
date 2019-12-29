# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    description { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end
