Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :jobs
  resources :skills, only: [] do
    get "search", on: :collection
  end


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
    end
  end
end


