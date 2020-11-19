Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"
  resources :items do
    root to:"orders#index"
    resources :orders, only: [:create]
  end
end
