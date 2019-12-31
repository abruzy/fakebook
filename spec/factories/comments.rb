# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    association :user, factory: :user
    association :post, factory: :post
  end
end
