Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  namespace :my do
    resources :users, only: [:show] do
      resources :users_skills
      resources :experiences
    end
  end
end


