FactoryBot.define do
  factory :comment do
    body { "MyString" }
    user { nil }
    posts { nil }
  end
end
