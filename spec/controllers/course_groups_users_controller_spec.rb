require 'rails_helper'

RSpec.describe CourseGroupsUsersController, type: :controller do
  shared_examples 'course group is empty' do
    let(:params) { {} }
    before { get :new, params: params }

    it { expect(response.status).to eq 302 }
    it { expect(controller).to redirect_to(root_path) }
    it { expect(controller.notice).to eq 'URL не существует' }
  end

  describe '#new' do
    context 'when format is invalid' do
      it { expect { get(:new, format: :json) }.to raise_error(ActionController::UnknownFormat) }
    end

    context 'when param course group id is missing' do
      it_behaves_like 'course group is empty'
    end

    context 'when course group is not found' do
      let(:course_group) { create :course_group }
      let(:params) { {course_group_id: course_group.id + 1} }

      it_behaves_like 'course group is empty'
    end

    context 'when all is ok' do
      let(:course_group) { create :course_group }
      let(:params) { {course_group_id: course_group.id} }

      before { get :new, params: params }

      it { expect(response.status).to eq 200 }
    end
  end

  describe '#create' do
    let!(:course) { create :course }

    context 'when param is missing' do
      it { expect { post(:create) }.to raise_error(ActionController::ParameterMissing) }
    end

    context 'when format is invalid' do
      it do
        expect { post(:create, format: :json, params: {course_groups_user: {email: nil}}) }.
          to raise_error(ActionController::UnknownFormat)
      end
    end

    context 'when exchange rate is not saved' do
      before { post :create, params: {course_groups_user: {email: nil}} }

      it { expect(response.status).to eq 200 }
      it { expect(controller).to render_template(:new) }
    end

    context 'when all is ok' do
      let(:course_group) { create :course_group }

      before do
        post(
          :create,
          params: {
            course_groups_user: {
              course_group_id: course_group.id,
              email: 'student@example.com'
            }
          }
        )
      end

      it { expect(response.status).to eq 302 }
      it { expect(controller).to redirect_to(course_path(assigns(:course_groups_user).course_group.course_id)) }
      it { expect(controller.notice).to eq 'Вы успешны записаны в группу.' }
    end

    it { should permit(:course_group_id, :email).for(:create, params: {course_groups_user: {param: nil}}) }
  end
end
