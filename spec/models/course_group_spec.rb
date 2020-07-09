require 'rails_helper'

RSpec.describe CourseGroup, type: :model do
  let(:course_group) { build :course_group }

  describe 'validations' do
    it { expect(course_group).to validate_presence_of(:title) }
    it { expect(course_group).to validate_uniqueness_of(:title).scoped_to(:course_id) }
    it { expect(course_group).to validate_presence_of(:course) }
    it { expect(course_group).to validate_presence_of(:started_at) }
  end

  describe 'before save' do
    it { expect { course_group.save! }.to change { course_group.course_title }.from(nil).to(course_group.course.title) }
  end
end
