Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'

  # resources :tasks do
  #   resources :answers
  # end

  # get 'answers/new/:task_id', to: 'answers#new'
  # post 'answers/new/:task_id', to: 'answers#create'
  #
  # resources :answers


  resources :answers do
    get ':task_id', to: 'answers#new', on: :new, as: :new_answer_for_task #, as: 'task' # makes 'task_new_answer' helper
    # member do
    #
    #   # get 'technical-new'
    # end
  end

  # User can trigger assignment of random tasks to him self
  patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
  # User can answer the question
  # patch '/home/assign-task', to: 'home#assign_task', as: 'assign_task'
end
