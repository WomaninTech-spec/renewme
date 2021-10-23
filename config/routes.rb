Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles
  resources :jobs, only: [:index,:show]
  namespace :my do
    resources :jobs
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :followings_users, only: [:create, :destroy]
    resources :messages
    resources :chatrooms, only: :show
    resources :recommandations, only: :create
  end
  namespace :my do
    resources :jobs
    resources :users, only: [:show] do
      resources :users_skills
      resources :experiences
    end
  end
end


