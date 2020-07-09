class CourseGroupDecorator < Draper::Decorator
  delegate_all

  def started_at_human_name
    @started_at_human_name ||= started_at.strftime('%d.%m.%Y %H:%M')
  end
end
