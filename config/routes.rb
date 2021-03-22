Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  # devise_for :users
  # devise_for :admin_users, ActiveAdmin::Devise.config

  resources :tasks
  resources :answers

  patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
end
