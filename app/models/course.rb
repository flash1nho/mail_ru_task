class Course < ApplicationRecord
  has_many :course_groups, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true, if: proc { |record| record.title.present? }
end
