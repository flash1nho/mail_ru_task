require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#error_text' do
    context 'when one error' do
      it { expect(helper.error_text(1)).to eq '1 Ошибка' }
    end

    context 'when two errors' do
      it { expect(helper.error_text(2)).to eq '2 Ошибки' }
    end

    context 'when ten errors' do
      it { expect(helper.error_text(10)).to eq '10 Ошибок' }
    end
  end
end
