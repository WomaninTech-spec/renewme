Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :jobs do
    resources :jobs_applications, only: :create
  end
  resources :skills, only: [] do
    get "search", on: :collection
  end
  resources :activities, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :followings_users, only: [:create, :destroy]
    resources :messages do
      get "messages-unread", on: :collection
    end
    resources :chatrooms, only: :show do
      post "mark-as-read", on: :member
    end
    resources :recommandations, only: :create
  end
  namespace :my do
    resources :users, only: [:show] do
      resources :users_skills
      resources :experiences
      resources :jobs
      resources :jobs_applications, only: [] do
        get 'my-jobs-applications', on: :collection
        get 'my-jobs-applicants', on: :collection
      end
    end
  end
end


