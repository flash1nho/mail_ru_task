Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  root 'courses#index'

  resources :courses, only: [:index, :show]
  resources :course_groups_users, only: [:new, :create]
end
