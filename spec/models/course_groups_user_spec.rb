require 'rails_helper'

RSpec.describe CourseGroupsUser, type: :model do
  let(:course_groups_user) { build :course_groups_user }

  describe 'validations' do
    it { expect(course_groups_user).to validate_presence_of(:email) }
    it { expect(course_groups_user).to validate_uniqueness_of(:email).scoped_to(:course_group_id) }

    context 'when email is invalid' do
      it do
        expect(course_groups_user).
          not_to allow_value('1', 'abc', '1.2', '0001-12-01', '2015-12-01', '2015-01-45').for(:email)
      end
    end
  end

  describe 'after create' do
    it { expect { course_groups_user.save! }.to change { course_groups_user.course_group.users_count }.from(0).to(1) }
  end
end
