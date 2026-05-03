Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :news, only: [:index]
  resources :categories, only: [:index]
  resource :profile, only: [:show]
  
  # Coin detail page
  get "coin/:id" => "coins#show", as: :coin
  
  # News show with slug (SEO-friendly)
  get "news/:id" => "news#show", as: :news
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
