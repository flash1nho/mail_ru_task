require 'rails_helper'

RSpec.describe CourseGroupDecorator, type: :decorator do
  let(:course_group) { build :course_group }
  let(:decorator) { course_group.decorate }

  describe '#started_at_human_name' do
    it { expect(decorator.started_at_human_name).to eq(course_group.started_at.strftime('%d.%m.%Y %H:%M')) }
  end
end
