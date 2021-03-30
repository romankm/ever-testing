Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  resources :answers do
    get ':task_id', to: 'answers#new', on: :new, as: :new_answer_for_task
  end

  # User can trigger assignment of random tasks to him self
  patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
end
