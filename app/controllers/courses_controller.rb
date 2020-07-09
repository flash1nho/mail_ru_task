class CoursesController < ApplicationController
  def index
    @course_groups = CourseGroup.all.map(&:decorate)

    respond_to do |format|
      format.html
    end
  end

  def show
    @course = Course.includes(:course_groups, course_groups: [:course_groups_users]).find_by_id(params[:id])

    respond_to do |format|
      if @course.present?
        format.html
      else
        format.html { redirect_to root_path, notice: 'URL не существует' }
      end
    end
  end
end
