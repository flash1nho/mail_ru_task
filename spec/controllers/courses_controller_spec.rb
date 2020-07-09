require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  shared_examples 'index or show' do
    let(:cmethod) { :index }

    context 'when format is invalid' do
      it { expect { get(cmethod, format: :json) }.to raise_error(ActionController::UnknownFormat) }
    end
  end

  describe '#index' do
    it_behaves_like 'index or show'

    context 'when all is ok' do
      before { get :index }

      it { expect(response.status).to eq 200 }
    end
  end

  describe '#show' do
    let(:cmethod) { :show }

    it_behaves_like 'index or show'

    context 'when param id is missing' do
      it { expect { get(cmethod) }.to raise_error(ActionController::UrlGenerationError) }
    end

    context 'when course is not found' do
      let(:course) { create :course }

      before { get cmethod, params: {id: course.id + 1} }

      it { expect(response.status).to eq 302 }
      it { expect(controller).to redirect_to(root_path) }
      it { expect(controller.notice).to eq 'URL не существует' }
    end

    context 'when all is ok' do
      let(:course) { create :course }

      before { get cmethod, params: {id: course.id} }

      it { expect(response.status).to eq 200 }
    end
  end
end
