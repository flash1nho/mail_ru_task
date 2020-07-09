module ApplicationHelper
  def error_text(errors_count)
    "#{errors_count} #{Russian.p(errors_count, 'Ошибка', 'Ошибки', 'Ошибок')}"
  end
end
