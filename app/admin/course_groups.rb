ActiveAdmin.register CourseGroup do
  menu priority: 3, label: proc { I18n.t("active_admin.course_groups") }

  permit_params do
    [:title, :course_id, :started_at]
  end

  form do |f|
    f.inputs  do
      f.input :title
      f.input :course, as: :select, collection: Course.all.map { |course| [course.title, course.id] }
      f.input :started_at
    end

    f.actions
  end

  show do
    attributes_table do
      row :title
      row :course
      row :started_at
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
