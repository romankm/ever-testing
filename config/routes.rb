Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  resources :tasks
  resources :answers

  # User can trigger assignment of random tasks to him self
  patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
  # User can answer the question
  # patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
end
