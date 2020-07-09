class CourseGroupsUsersController < ApplicationController
  def new
    @course_groups_user = CourseGroupsUser.new(course_group_id: params[:course_group_id])

    respond_to do |format|
      if @course_groups_user.course_group.blank?
        format.html { redirect_to root_path, notice: 'URL не существует' }
      else
        format.html
      end
    end
  end

  def create
    @course_groups_user = CourseGroupsUser.new(course_groups_user_params)

    respond_to do |format|
      if @course_groups_user.save
        format.html do
          redirect_to course_path(@course_groups_user.course_group.course_id), notice: 'Вы успешны записаны в группу.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def course_groups_user_params
    params.require(:course_groups_user).permit(:course_group_id, :email)
  end
end
