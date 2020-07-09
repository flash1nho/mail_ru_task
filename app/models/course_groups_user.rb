class CourseGroupsUser < ApplicationRecord
  EMAIL_REGEXP = /\A[a-z0-9\-_]+(?:\.[a-z0-9\-\._]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z]{2,}\Z/i

  belongs_to :course_group

  validates :email, presence: true
  validates :email, uniqueness: {scope: :course_group_id}, if: proc { |record| record.email.present? }
  validates :email, format: {with: EMAIL_REGEXP}, if: proc { |record| record.email.present? }

  after_create :populate_course_group_users_count

  private

  def populate_course_group_users_count
    course_group.increment!(:users_count)
  end
end
