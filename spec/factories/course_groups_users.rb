FactoryBot.define do
  factory :course_groups_user do
    sequence(:email) { |n| "student#{n}@example.com" }

    association :course_group
  end
end
