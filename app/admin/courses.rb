ActiveAdmin.register Course do
  menu priority: 2, label: proc { I18n.t("active_admin.courses") }

  permit_params :title
end
