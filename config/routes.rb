Rails.application.routes.draw do
  resources :articles
  resources :jobs, only: [:index,:show]
  namespace :my do
    resources :jobs
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


