FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Курс #{n}" }
  end
end
