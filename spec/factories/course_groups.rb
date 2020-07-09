FactoryBot.define do
  factory :course_group do
    sequence(:title) { |n| "Группа #{n}" }
    started_at { 1.days.from_now }

    association :course
  end
end
