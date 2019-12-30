FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :post, factory: :post
  end
end
