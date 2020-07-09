require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    let(:course) { build :course }

    it { expect(course).to validate_presence_of(:title) }
    it { expect(course).to validate_uniqueness_of(:title) }
  end
end
