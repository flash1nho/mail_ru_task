class CourseGroup < ApplicationRecord
  belongs_to :course

  has_many :course_groups_users, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: {scope: :course_id}, if: proc { |record| record.title.present? && record.course.present? }
  validates :course, presence: true
  validates :started_at, presence: true

  before_save :populate_course_title

  private

  def populate_course_title
    return unless course.present?

    self.course_title = course.title
  end
end
